public class Orm: IDisposable
{
    private Database database;

    public Orm(Database database)
    {
        this.database = database;
    }

    public void Begin()
    {
        try{
            if (database.DbState != Database.State.Closed) throw new InvalidOperationException("begin");
            database.BeginTransaction();
        //database.DbState should be Database.State.TransactionStarted
        } catch(System.Exception e) {
            database.Dispose();
            //database.DbState should be Database.State.Closed
            //throw e;
        }
    }

    public void Write(string data)
    {
        try{
            if (database.DbState != Database.State.TransactionStarted) throw new InvalidOperationException("write");
            database.Write(data);
            //database.DbState should be Database.State.DataWritten
        } catch(System.Exception e) {
            database.Dispose();
            //database.DbState should be Database.State.Closed
            //throw e;
        }
    }

    public void Commit()
    {
        try{
            if (database.DbState != Database.State.DataWritten) throw new InvalidOperationException("commit");
            database.EndTransaction();
        }catch(System.Exception e){
            database.Dispose();
            //database.DbState should be Database.State.Closed
            //throw e;
        }
    }

    public void Dispose(){
        database.Dispose();
    }
}
