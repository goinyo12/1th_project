//��� ���� Ŭ����

package kickoff.vo;

public class ReplyVO 
{
	private String reply_no;     //��۹�ȣ
	private String reply_date;   //����ۼ�����
	private String reply_note;   //��۳���
	private String reply_blind;  //��ۺ���ε� ����
	private String user_no;      //����ۼ��� ȸ����ȣ
	private String user_name;    //����ۼ��� �̸�
	private String user_nick;    //����ۼ��� �г���
	private String post_no;      //�Խñ� ��ȣ
	
	public ReplyVO()
	{
		reply_no    = "";
		reply_date  = "";
		reply_note  = "";
		reply_blind = "";
		user_no     = "";
		user_name   = "";
		user_nick   = "";
		post_no     = "";
	}

	public String getReply_no()    { return reply_no;    }
	public String getReply_date()  { return reply_date;  }
	public String getReply_note()  { return reply_note;  }
	public String getReply_blind() { return reply_blind; }
	public String getUser_no()     { return user_no;     }
	public String getUser_name()   { return user_name;   }
	public String getUser_nick()   { return user_nick;   }
	public String getPost_no()     { return post_no;     } 

	public void setReply_no(String reply_no)       { this.reply_no    = reply_no;    }
	public void setReply_date(String reply_date)   { this.reply_date  = reply_date;  }
	public void setReply_note(String reply_note)   { this.reply_note  = reply_note;  }
	public void setReply_blind(String reply_blind) { this.reply_blind = reply_blind; }
	public void setUser_no(String user_no)         { this.user_no     = user_no;     }
	public void setUser_name(String user_name)     { this.user_name   = user_name;   }
	public void setUser_nick(String user_nick)     { this.user_nick   = user_nick;   }
	public void setPost_no(String post_no)         { this.post_no     = post_no;     }
	
}
