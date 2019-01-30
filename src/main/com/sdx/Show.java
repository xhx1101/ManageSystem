package sdx;

import java.util.concurrent.Executor;
import java.util.concurrent.Executors;

public class Show {
    public static void main(String[] args) {
        Executor executor=Executors.newSingleThreadExecutor();
        executor.execute(new SendData(new ShowBox()));
    }
}

