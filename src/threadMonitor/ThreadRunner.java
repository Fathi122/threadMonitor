package threadMonitor;

public class ThreadRunner implements Runnable{

	@Override
	public void run() {
		// TODO Auto-generated method stub
		while (true){
			System.out.println("Running Thread");
			try {
				Thread.sleep(5000);
			} catch (InterruptedException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
	}

}
