package kickoff.dao;

import java.util.Map;
import java.io.*;

public class pythonbrowse {
	public String test(String key){
		String outBuffer = "";
		//�߿�!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
		//���̽� ���� ȯ�� ��� ����
			String RunPath = "C:\\ProgramData\\anaconda3\\";
		//���̽� �������� ����
			String command = RunPath + "pythonw.exe";
		//���̽� �ڵ� ���� ����
			String pyname  = "D:\\SHS\\second project\\kick_off_view\\WebContent\\python\\graph\\project04.py";
		// ==========================================================================================================
		// ��Ÿ�� ���̺귯���� �̿�
//			String RunPath = "C:\\Users\\MYCOM\\.conda\\envs\\myEnv\\";
//			String pyname  = "X:\\TEST\\JSP_PY_JDK8\\WebContent\\py\\plot.py";

		// ==========================================================================================================
		try
		{
	        ProcessBuilder builder = new ProcessBuilder();
	        builder.command(command, pyname,"--key",key);
			Map<String, String> envs = builder.environment();
		    envs.put("Path", RunPath + "Scripts");
		    envs.put("Path", RunPath + "Library\\bin");
		    int exitVal = 0;
//		    try {
		    	Process process = builder.start();
//		    	exitVal = process.waitFor();  // �ڽ� ���μ����� ����� ������ ��ٸ�
//		    	BufferedReader br = new BufferedReader(new InputStreamReader(process.getInputStream(), "euc-kr"));
//		    	String line;			
//		    	// ���� ���μ����� ����ϴ� ������ �ޱ� ����
//		    	while ((line = br.readLine()) != null) 
//		    	{
//		    		System.out.println(line); // ǥ����¿� ����
//		    		outBuffer += line;
//		    	}
//		    }catch(Exception e)
//		    {
//		    	System.out.println(e);
//		    }
//			if(exitVal != 0) 
//			{
//				// ������ ����
//				System.out.println("���� ���μ����� ������ ����Ǿ���.");
//			}
//			System.out.print(outBuffer);
		    System.out.println("OK");
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		return outBuffer;
	}
}