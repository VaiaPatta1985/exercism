public record struct Coord: IComparable
{
    public Coord(ushort x, ushort y)
    {
        X = x;
        Y = y;
    }

    public ushort X { get; }
    public ushort Y { get; }

    public int CompareTo(Object otherObject){
        if (otherObject is Coord other){
            if (X == other.X) return (int) (Y - other.Y);
        return (int) (X - other.X);
        }
        throw new ArgumentException();
    }
}

public class ComparableCoordList: List<Coord>
{
    public override bool Equals(Object otherObject)
    {
        if (otherObject is ComparableCoordList other) {
            var thisList = (List<Coord>) this;
            var otherList = (List<Coord>) other;
            var myLength = thisList.Count;
            if (myLength != otherList.Count) return false;
            var areEqual = true;
            for (var i=0; i<myLength; i++) areEqual = areEqual && (thisList[i] == otherList[i]);
            return areEqual;
        }
        return false;
    }

    public override int GetHashCode()
    {
        var thisList = (List<Coord>) this;
        return thisList.Count switch
        {
            0 => 0,
            1 => thisList[0].GetHashCode(),
            2 => HashCode.Combine(thisList[0].GetHashCode(), thisList[1].GetHashCode()),
            3 => HashCode.Combine(thisList[0].GetHashCode(), thisList[1].GetHashCode(), thisList[2].GetHashCode()),
            4 => HashCode.Combine(thisList[0].GetHashCode(), thisList[1].GetHashCode(), thisList[2].GetHashCode(), thisList[3].GetHashCode()),
            5 => HashCode.Combine(thisList[0].GetHashCode(), thisList[1].GetHashCode(), thisList[2].GetHashCode(), thisList[3].GetHashCode(), thisList[4].GetHashCode()),
            6 => HashCode.Combine(thisList[0].GetHashCode(), thisList[1].GetHashCode(), thisList[2].GetHashCode(), thisList[3].GetHashCode(), thisList[4].GetHashCode(), thisList[5].GetHashCode()),
            7 => HashCode.Combine(thisList[0].GetHashCode(), thisList[1].GetHashCode(), thisList[2].GetHashCode(), thisList[3].GetHashCode(), thisList[4].GetHashCode(), thisList[5].GetHashCode(), thisList[6].GetHashCode()),
            _ => HashCode.Combine(thisList[0].GetHashCode(), thisList[1].GetHashCode(), thisList[2].GetHashCode(), thisList[3].GetHashCode(), thisList[4].GetHashCode(), thisList[5].GetHashCode(), thisList[6].GetHashCode(), thisList[7].GetHashCode())
        };
    }
}

public readonly record struct Plot
{
    public readonly ComparableCoordList coords;

    public Plot(Coord coord0, Coord coord1, Coord coord2, Coord coord3) {
        coords = new ComparableCoordList();
        coords.Add(coord0);
        coords.Add(coord1);
        coords.Add(coord2);
        coords.Add(coord3);
        coords.Sort();
    }

    // max and min coordinates
    public ushort MaxX {get => ((List<Coord>) coords).Max().X;}
    public ushort MinX {get => ((List<Coord>) coords).Min().X;}
    public ushort MaxY {get => ((List<Coord>) coords).MaxBy(coord => coord.Y).Y;}
    public ushort MinY {get => ((List<Coord>) coords).MinBy(coord => coord.Y).Y;}
    // we then get the sides of the rectangular cover along the xy axis
    // (which in this exercise is the same as the actual plot)
    // and say that that's the "longest side" we want to compare later
    // (cause why not)
    public ushort RectangularCoverSideX {get => (ushort)(MaxX - MinX);}
    public ushort RectangularCoverSideY {get => (ushort)(MaxY - MinY);}
    public ushort RectangularCoverSideLongest {get => RectangularCoverSideX > RectangularCoverSideY ? RectangularCoverSideX : RectangularCoverSideY;}
}

public class ClaimsHandler
{
    private readonly List<Plot> claims = new List<Plot>();

    public void StakeClaim(Plot plot) => claims.Add(plot);

    public bool IsClaimStaked(Plot plot) => claims.Contains(plot);

    public bool IsLastClaim(Plot plot) => claims.Count > 0 && plot.Equals(claims[^1]);

    public Plot GetClaimWithLongestSide() => claims.MaxBy(claim => claim.RectangularCoverSideLongest);
}
