public class Player
{
    public int RollDie() => (new System.Random()).Next(1, 19);

    public double GenerateSpellStrength() => 100 * (new System.Random()).NextDouble();
}
