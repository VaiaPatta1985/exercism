public readonly record struct Coord
{
    public Coord(ushort x, ushort y)
    {
        X = x;
        Y = y;
    }

    public ushort X { get; }
    public ushort Y { get; }
}

public class ComparableCoordSet: HashSet<Coord>
{
    public override bool Equals(Object otherObject) => otherObject is ComparableCoordSet other && ((HashSet<Coord>) this).SetEquals((HashSet<Coord>) other);

    public override int GetHashCode() => ((HashSet<Coord>) this).Aggregate(0, HashCode.Combine);
}

public readonly record struct Plot
{
    private readonly ComparableCoordSet coords;

    public Plot(Coord coord0, Coord coord1, Coord coord2, Coord coord3) {
        coords = new ComparableCoordSet();
        coords.Add(coord0);
        coords.Add(coord1);
        coords.Add(coord2);
        coords.Add(coord3);
    }

    // max and min coordinates
    public ushort MaxX {get => ((HashSet<Coord>) coords).MaxBy(coord => coord.X).X;}
    public ushort MinX {get => ((HashSet<Coord>) coords).MinBy(coord => coord.X).X;}
    public ushort MaxY {get => ((HashSet<Coord>) coords).MaxBy(coord => coord.Y).Y;}
    public ushort MinY {get => ((HashSet<Coord>) coords).MinBy(coord => coord.Y).Y;}
    public ushort RectangularCoverSideX {get => (ushort)(MaxX - MinX);}
    public ushort RectangularCoverSideY {get => (ushort)(MaxY - MinY);}
    public ushort RectangularCoverSideLongest {get => Math.Max(RectangularCoverSideX, RectangularCoverSideY);}
}

public class ClaimsHandler
{
    private readonly List<Plot> claims = [];

    public void StakeClaim(Plot plot) => claims.Add(plot);

    public bool IsClaimStaked(Plot plot) => claims.Contains(plot);

    public bool IsLastClaim(Plot plot) => claims.Count > 0 && plot == claims[^1];

    public Plot GetClaimWithLongestSide() => claims.MaxBy(claim => claim.RectangularCoverSideLongest);
}
