package threadMonitor;

public class ThreadMain {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Thread aThread = new Thread(new ThreadRunner());
		aThread.start();
	}

}
