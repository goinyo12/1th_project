package kickoff.vo;

public class analyze1VO 
{
	private String anal_no;              //�м���ȣ
	private String morph_origin_key;     //���¼� �����ܾ�
	private String post_no;              //�Խù���ȣ
	private String anal_count;           //�󵵼�
	
	public analyze1VO()
	{
		anal_no             = "";
		morph_origin_key    = "";
		post_no             = "";
		anal_count          = "";
	}

	public String getAnal_no()             { return anal_no;             }
	public String getMorph_origin_key()    { return morph_origin_key;    }
	public String getPost_no()             { return post_no;             }
	public String getAnal_count()          { return anal_count;          }

	public void setAnal_no(String anal_no)                         { this.anal_no = anal_no;                   }
	public void setMorph_origin_key(String morph_origin_key)       { this.morph_origin_key = morph_origin_key; }
	public void setPost_no(String post_no)                         { this.post_no = post_no;                   }
	public void setAnal_count(String anal_count)                   { this.anal_count = anal_count;             }
	
	
}
