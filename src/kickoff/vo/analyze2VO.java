package kickoff.vo;

public class analyze2VO 
{
	private String analdata_no;          //������ȣ
	private String anal_no;              //�м���ȣ
	private String morph_relation_key;  //���¼� �м��ܾ�
	private String sim;                  //���絵
		
	public analyze2VO()
	{
		analdata_no         = "";
		anal_no             = "";
		morph_relation_key = "";
		sim                 = "";
	}

	public String getAnal_no()             { return anal_no;             }
	public String getMorph_relation_key()  { return morph_relation_key; }
	public String getAnaldata_no()         { return analdata_no;         }
	public String getSim()                 { return sim;                 }

	public void setAnal_no(String anal_no)                         { this.anal_no = anal_no;                         }
	public void setMorph_relation_key(String morph_relation_key)   { this.morph_relation_key = morph_relation_key; }
	public void setAnaldata_no(String analdata_no)                 { this.analdata_no = analdata_no;                 }
	public void setSim(String sim)                                 { this.sim = sim;                                 }
}
