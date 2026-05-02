export const findSequence = (start, prisms_degrees) => {
  console.log('--------');//debug
  if (prisms_degrees.length == 0){return [];}
  
  const very_small = 0.00005;
  
  const degrees_to_rad = (degrees)=>degrees/180*Math.PI;
  const eq = (a, b)=>{return (a - b < very_small && b - a < very_small);};
  //const eq = (a, b)=>{return (a == b)};
  const sign = (x)=>(x < 0 ? -1 : 1);
  
  let beam = {x: start.x, y: start.y, angle: degrees_to_rad(start.angle)};
  let prisms = prisms_degrees.map(
    (prism)=>{
      return {id: prism.id, x: prism.x, y: prism.y, angle: degrees_to_rad(prism.angle)};
    }
  );

  const colocated = (p1, p2)=>{return (eq(p1.x, p2.x) && eq(p1.y, p2.y));};
  const is_on_path = (prism, laser)=>(
    eq(prism.x, laser.x) ? eq(laser.angle, sign(prism.y - laser.y) * Math.PI/2) : eq(Math.atan2(prism.y - laser.y, prism.x - laser.x), laser.angle)
  );
  
  let prisms_on_path = [];
  let prism_order = [];
  let next_prism;
  const info = (prism)=>('id: '+prism.id+' x: '+prism.x+' y: '+prism.y+' angle: '+prism.angle);//debug
  
  for(const prism of prisms){
    if(is_on_path(prism, beam)){prisms_on_path.push(prism);}
  }
  while(prisms_on_path.length > 0){
    if(prisms_on_path.length > 1){
      prisms_on_path.sort(
        (prism1, prism2)=>{
          if(eq(beam.angle, 0)){
            return (sign(prism1.x - prism2.x));
          }else{
            return (sign(beam.angle * prism1.y - beam.angle * prism2.y));
          }
        }
      );
    }
    next_prism = prisms_on_path[0];
    prism_order.push(next_prism.id);
    beam.x = next_prism.x;
    beam.y = next_prism.y;
    beam.angle += next_prism.angle;
    while(beam.angle > Math.PI){beam.angle -= 2 * Math.PI;}
    while(beam.angle <= -Math.PI){beam.angle += 2 * Math.PI;}
    prisms_on_path = [];
    for(const prism of prisms){
      if(is_on_path(prism, beam) && !colocated(prism,beam)){prisms_on_path.push(prism);}
    }
  }
  return prism_order;
};
