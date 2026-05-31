public struct Coord//: IComparable
{
    public Coord(ushort x, ushort y)
    {
        X = x;
        Y = y;
    }

    public ushort X { get; }
    public ushort Y { get; }
    // only needed for non-rectangular plots
    /*
    public int CompareTo(Object other_object){
        if (other_object is Coord other){
            if (X == other.X) return (int) (Y - other.Y);
        return (int) (X - other.X);
        }
        throw new ArgumentException();
    }
    */
}

public struct Plot
{
    public List<Coord> coords;
// ***************************************************************************
//                               QUESTION
    // why does this method not work...
    /*
    public Plot(params Coord[] coordinates) {
        if (coordinates.Length != 4) throw new Exception();
        coords = new List<Coord>();
        foreach(Coord coordinate in coordinates) coords.Add(coordinate);
    }
    */
    // ...instead of this one?
    public Plot(Coord coord0, Coord coord1, Coord coord2, Coord coord3) {
        coords = new List<Coord>();
        coords.Add(coord0);
        coords.Add(coord1);
        coords.Add(coord2);
        coords.Add(coord3);
    }
// ***************************************************************************
    // current version of equality method
    public override bool Equals(Object other_object) {
        if (other_object is Plot other) return maxX() == other.maxX() && minX() == other.minX() && maxY() == other.maxY() && minY() == other.minY();
        throw new ArgumentException();
    }
    // just for kicks, prepare to cover the case of non-rectangular 4-sided plots
    // this equality method always works, no matter the shape (needs Coord.CompareTo)
    /*
    public override bool Equals(Object other_object) {
        Coord[] sorted_coords;
        Coord[] sorted_coords_other;
        if (other_object is Plot other){
            sorted_coords = (Coord[]) coords.ToArray<Coord>().Clone();
            sorted_coords_other = (Coord[]) other.coords.ToArray<Coord>().Clone();
            Array.Sort(sorted_coords);
            Array.Sort(sorted_coords_other);
            for(int index=0;index<4;index++) if (!(sorted_coords[index].Equals(sorted_coords_other[index]))) return false;
            return true;
        }
        throw new ArgumentException();
    }
    */
    // max and min coordinates
    public ushort maxX() {
        ushort result = 0;
        foreach (Coord coord in coords) if (coord.X > result) result = coord.X;
        return result;
    }
    public ushort minX() {
        ushort result = unchecked((ushort) -1); //65535
        foreach (Coord coord in coords) if (coord.X < result) result = coord.X;
        return result;
    }
    public ushort maxY() {
        ushort result = 0;
        foreach (Coord coord in coords) if (coord.Y > result) result = coord.Y;
        return result;
    }
    public ushort minY() {
        ushort result = unchecked((ushort) -1); //65535
        foreach (Coord coord in coords) if (coord.Y < result) result = coord.Y;
        return result;
    }
    // we then get the sides of the rectangular cover along the xy axis
    // (which in this exercise is the same as the actual plot)
    // and say that that's the "longest side" we want to compare later
    // (cause why not)
    public ushort rectangular_cover_sideX() => (ushort)(maxX() - minX());
    public ushort rectangular_cover_sideY() => (ushort)(maxY() - minY());
    public ushort rectangular_cover_side_longest() {
        ushort sideX = rectangular_cover_sideX();
        ushort sideY = rectangular_cover_sideY();
        return sideX > sideY ? sideX : sideY;
    }
}

public class ClaimsHandler
{
    public List<Plot> claims = new List<Plot>();

    public void StakeClaim(Plot plot) => claims.Add(plot);

    public bool IsClaimStaked(Plot plot) => claims.Contains(plot);

    public bool IsLastClaim(Plot plot) => plot.Equals(claims[^1]);

    public Plot GetClaimWithLongestSide()
    {
        ushort maxLength = 0;
        ushort longestSide;
        Plot result = claims[0];
        foreach (Plot claim in claims){
            longestSide = claim.rectangular_cover_side_longest();
            if (longestSide > maxLength) {
                maxLength = longestSide;
                result = claim;
            }
        }
        return result;
    }
}
