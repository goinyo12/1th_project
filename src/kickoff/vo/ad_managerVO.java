//���� ���� Ŭ����
package kickoff.vo;

public class ad_managerVO 
{
	private String ad_no;             //�����ȣ
	private String ad_name;           //�����̸�
	private String ad_keyword;        //����Ű����
	private String ad_exposure;       //�������Ƚ��
	private String ad_click;          //����Ŭ��Ƚ��
	private String w_image_phyname;   //�����̹��� ������
	private String w_image_fname;     //�����̹��� ����
	private String h_image_phyname;   //�����̹��� ������
	private String h_image_fname;     //�����̹��� ����
	
	public ad_managerVO()
	{
		ad_no           = "";
		ad_name         = "";
		ad_keyword      = "";
		ad_exposure     = "";
		ad_click        = "";
		w_image_phyname = "";
		w_image_fname   = "";
		h_image_phyname = "";
		h_image_fname   = "";
	}

	//getter
	public String getAd_no()           { return ad_no;           }
	public String getAd_name()         { return ad_name;         }
	public String getAd_keyword()      { return ad_keyword;      }
	public String getAd_exposure()     { return ad_exposure;     }
	public String getAd_click()        { return ad_click;        }
	public String getW_image_phyname() { return w_image_phyname; }
	public String getW_image_fname()   { return w_image_fname;   }
	public String getH_image_phyname() { return h_image_phyname; }
	public String getH_image_fname()   { return h_image_fname;   }

	//setter
	public void setAd_no(String ad_no)                     { this.ad_no = ad_no;                     }
	public void setAd_name(String ad_name)                 { this.ad_name = ad_name;                 }
	public void setAd_keyword(String ad_keyword)           { this.ad_keyword = ad_keyword;           }  
	public void setAd_exposure(String ad_exposure)         { this.ad_exposure = ad_exposure;         }
	public void setAd_click(String ad_click)               { this.ad_click = ad_click;               }
	public void setW_image_phyname(String w_image_phyname) { this.w_image_phyname = w_image_phyname; }
	public void setW_image_fname(String w_image_fname)     { this.w_image_fname = w_image_fname;     }
	public void setH_image_phyname(String h_image_phyname) { this.h_image_phyname = h_image_phyname; }
	public void setH_image_fname(String h_image_fname)     { this.h_image_fname = h_image_fname;     }
	
}
