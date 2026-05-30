public class FacialFeatures
{
    public string EyeColor { get; }
    public decimal PhiltrumWidth { get; }

    public FacialFeatures(string eyeColor, decimal philtrumWidth)
    {
        EyeColor = eyeColor;
        PhiltrumWidth = philtrumWidth;
    }
    public override bool Equals(Object other) => other is FacialFeatures ff ? EyeColor.Equals(ff.EyeColor) && PhiltrumWidth == ff.PhiltrumWidth : false;
    public override int GetHashCode() => $"{EyeColor}{PhiltrumWidth}".GetHashCode();
}

public class Identity
{
    public string Email { get; }
    public FacialFeatures FacialFeatures { get; }

    public Identity(string email, FacialFeatures facialFeatures)
    {
        Email = email;
        FacialFeatures = facialFeatures;
    }
    public override bool Equals(Object other) => other is Identity id ? Email.Equals(id.Email) && FacialFeatures.Equals(id.FacialFeatures) : false;
    public override int GetHashCode() => $"{Email} {FacialFeatures.EyeColor}{FacialFeatures.PhiltrumWidth}".GetHashCode();
}

public class Authenticator
{
    private HashSet<Identity> registered_ids = new HashSet<Identity>();
    public static bool AreSameFace(FacialFeatures faceA, FacialFeatures faceB) => faceA.Equals(faceB);

    public bool IsAdmin(Identity identity) => identity.Equals(new Identity("admin@exerc.ism", new FacialFeatures("green", 0.9m)));

    public bool Register(Identity identity) => registered_ids.Add(identity);

    public bool IsRegistered(Identity identity) => registered_ids.Contains(identity);

    public static bool AreSameObject(Identity identityA, Identity identityB) => identityA == identityB;
}
