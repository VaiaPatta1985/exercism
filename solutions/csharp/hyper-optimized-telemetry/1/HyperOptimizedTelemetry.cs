public static class TelemetryBuffer
{
    public static byte[] ToBuffer(long reading)
    {
        byte[] buffer = {0, 0, 0, 0, 0, 0, 0, 0, 0};
        if (reading < Int32.MinValue || reading > UInt32.MaxValue) {
            buffer[0] = (byte) (256-sizeof(Int64));
            BitConverter.GetBytes(reading).CopyTo(buffer, 1);
            return buffer;
        }
        if (reading > Int32.MaxValue){
            buffer[0] = sizeof(UInt32);
            BitConverter.GetBytes((UInt32) reading).CopyTo(buffer, 1);
            return buffer;
        }
        if (reading < Int16.MinValue || reading > UInt16.MaxValue){
            buffer[0] = (byte) (256-sizeof(Int32));
            BitConverter.GetBytes((Int32) reading).CopyTo(buffer, 1);
            return buffer;
        }
        if (reading < 0) {
            buffer[0] = (byte) (256-sizeof(Int16));
            BitConverter.GetBytes((Int16) reading).CopyTo(buffer, 1);
            return buffer;
        }
        buffer[0] = sizeof(UInt16);
        BitConverter.GetBytes((UInt16) reading).CopyTo(buffer, 1);
        return buffer;
    }

    public static long FromBuffer(byte[] buffer)
    {
        switch (buffer[0]) {
            case sizeof(UInt16):
                return BitConverter.ToUInt16(buffer, 1);
            case (byte) (256-sizeof(Int16)):
                return BitConverter.ToInt16(buffer, 1);
            case (byte) (256-sizeof(Int32)):
                return BitConverter.ToInt32(buffer, 1);
            case sizeof(UInt32):
                return BitConverter.ToUInt32(buffer, 1);
            case (byte) (256-sizeof(Int64)):
                return BitConverter.ToInt64(buffer, 1);
            default:
                return 0;
        }
    }
}
