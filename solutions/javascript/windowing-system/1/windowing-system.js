// @ts-check

/**
 * Implement the classes etc. that are needed to solve the
 * exercise in this file. Do not forget to export the entities
 * you defined so they are available for the tests.
 */

export function Size(initialWidth=80, initialHeight=60){
  this.width = initialWidth;
  this.height = initialHeight;
}

Size.prototype.resize = function(newWidth, newHeight){
  this.width = newWidth;
  this.height = newHeight;
};

export function Position(initialX=0, initialY=0){
  this.x = initialX;
  this.y = initialY;
}

Position.prototype.move = function(newX, newY){
  this.x = newX;
  this.y = newY;
};

export class ProgramWindow{
  constructor(){
    this.screenSize = new Size(800,600);
    this.size = new Size();
    this.position = new Position();
  }

  resize(newWindowSize){
    let newHeight = newWindowSize.height;
    let newWidth = newWindowSize.width;
    if(newHeight<1){newHeight=1;}
    if(newWidth<1){newWidth=1;}
    if(newHeight+this.position.y>this.screenSize.height){
      newHeight=this.screenSize.height-this.position.y;
    }
    if(newWidth+this.position.x>this.screenSize.width){
      newWidth=this.screenSize.width-this.position.x;
    }
    this.size.height = newHeight;
    this.size.width = newWidth;
  }
  move(newPosition){
    let newX = newPosition.x;
    let newY = newPosition.y;
    if(newX<0){newX=0;}
    if(newY<0){newY=0;}
    if(this.size.height+newY>this.screenSize.height){
      newY=this.screenSize.height-this.size.height;
    }
    if(this.size.width+newX>this.screenSize.width){
      newX=this.screenSize.width-this.size.width;
    }
    this.position.x = newX;
    this.position.y = newY;
  }
}

export function changeWindow(window){
  window.resize(new Size(400, 300));
  window.move(new Position(100, 150));
  return window;
}
