using System.Collections.ObjectModel;
public class Authenticator
{
    private class EyeColor
    {
        public string Blue = "blue";
        public string Green = "green";
        public string Brown = "brown";
        public string Hazel = "hazel";
        public string Grey = "grey";
    }

    public Authenticator(Identity admin)
    {
        this.admin = admin;
    }

    private readonly Identity admin;
    
    private readonly IDictionary<string, Identity> developers
        = new ReadOnlyDictionary<string, Identity>(
            new Dictionary<string, Identity>
            {
                ["Bertrand"] = new Identity
                {
                    Email = "bert@ex.ism",
                    EyeColor = "blue"
                },
    
                ["Anders"] = new Identity
                {
                    Email = "anders@ex.ism",
                    EyeColor = "brown"
                }
            }
        );

    public Identity Admin
    {
        get => admin;
    }

    public IDictionary<string, Identity> GetDevelopers() => developers;
}

public struct Identity
{
    public string Email { get; set; }

    public string EyeColor { get; set; }
}
