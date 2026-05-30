public class Orm
{
    private Database database;

    public Orm(Database database)
    {
        this.database = database;
    }

    private void UnsafeWrite(Database db, string data){
        db.BeginTransaction();
        db.Write(data);
        db.EndTransaction();
    }

    public void Write(string data)
    {
        using Database db = database;
        try{
            UnsafeWrite(db, data);
        } catch (Exception){
            throw;
        }
    }

    public bool WriteSafely(string data)
    {
        using Database db = database;
        try{
            UnsafeWrite(db, data);
        } catch (Exception){
            return false;
        }
        return true;
    }
}
