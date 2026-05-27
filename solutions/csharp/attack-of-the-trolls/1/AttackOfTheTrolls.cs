enum AccountType {
    Guest,
    User,
    Moderator
}

[Flags]
enum Permission {
    None = 0,
    Read = 0b1,
    Write = 0b10,
    Delete = 0b100,
    All = 0b111
}

static class Permissions
{
    public static Permission Default(AccountType accountType)
    {
        switch (accountType) {
            case AccountType.Moderator:
                return Permission.All;
            case AccountType.User:
                return Permission.Read | Permission.Write;
            case AccountType.Guest:
                return Permission.Read;
            default:
                return Permission.None;
        }
    }

    public static Permission Grant(Permission current, Permission grant)
    {
        return current | grant;
    }

    public static Permission Revoke(Permission current, Permission revoke)
    {
        return current & ~revoke;
    }

    public static bool Check(Permission current, Permission check)
    {
        return (check & current) == check;
    }
}
