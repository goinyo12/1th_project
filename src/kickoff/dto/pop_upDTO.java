package kickoff.dto;

import java.util.ArrayList;

import kickoff.dao.*;
import kickoff.vo.*;

public class pop_upDTO extends DBManager
{
	public ArrayList<analyze1VO> Read1(String post_no)
	{
		ArrayList<analyze1VO> list = new ArrayList<analyze1VO>();
		
		String sql = "";
		
		this.DBOpen();

		sql  = "select anal_no,morph_origin_key,post_no,anal_count ";
		sql += "from analyze_data1 where post_no = " + post_no ;
		this.RunQuery(sql);
		while( this.GetNext() == true)
		{
			analyze1VO vo = new analyze1VO();
			vo.setPost_no(post_no);
			vo.setAnal_no(this.GetValue("anal_no"));
			vo.setMorph_origin_key(this.GetValue("morph_origin_key"));
			vo.setAnal_count(this.GetValue("anal_count"));
			list.add(vo);
		}
		this.DBClose();
		return list;
	}
	
	public ArrayList<analyze2VO> Read2(String anal_no)
	{
		ArrayList<analyze2VO> list = new ArrayList<analyze2VO>();
		
		String sql = "";
		
		this.DBOpen();

		sql  = "select analdata_no,anal_no,morph_relation_key,sim ";
		sql += "from analyze_data2 where anal_no = " + anal_no + " limit 0,5 ";
		this.RunQuery(sql);
		while( this.GetNext() == true)
		{
			analyze2VO vo = new analyze2VO();
			vo.setAnal_no(anal_no);
			vo.setAnaldata_no(this.GetValue("analdata_no"));
			vo.setMorph_relation_key(this.GetValue("morph_relation_key"));
			vo.setSim(this.GetValue("sim"));
			list.add(vo);
		}
		this.DBClose();
		return list;
	}
	
	public PostVO Read(String post_no)
	{
		String sql = "";
		
		this.DBOpen();

		sql  = "select post_posneg,post_percent,post_figname,post_no from post where post_no = " + post_no;
		this.RunQuery(sql);
		if( this.GetNext() == false)
		{
			//�ش� �Խù� ����.
			this.DBClose();
			return null;
		}
		PostVO vo = new PostVO();
		vo.setPost_no(post_no);
		vo.setPost_posneg(this.GetValue("post_posneg"));
		vo.setPost_figname(this.GetValue("post_figname"));
		vo.setPost_percent(this.GetValue("post_percent"));
		
		this.DBClose();
		return vo;
	}
	
	//���� Ű����� �˻��ؼ� ���� �������� ����
	public ad_managerVO Read_ad(int ad_no)
	{
		String sql = "";
		
		this.DBOpen();

		sql  = "SELECT ad_no, ad_keyword, ad_name FROM ad_info WHERE ad_no = " + ad_no ;
		System.out.println("pop_upDTO / Read_ad :  " + sql);
		this.RunQuery(sql);
		if( this.GetNext() == false)
		{
			//�ش� �Խù� ����.
			this.DBClose();
			return null;
		}
		ad_managerVO vo = new ad_managerVO();

		// setter��� vo ���� ��ȯ
		vo.setAd_name(this.GetValue("ad_name"));
		vo.setAd_no(this.GetValue("ad_no"));
		vo.setAd_keyword(this.GetValue("ad_keyword"));
		
		this.DBClose();
		return vo;
	}
	
	public int Find_ad(String keyword)
	{
		String sql = "";
		
		this.DBOpen();

		sql  = "SELECT count(*) as count FROM ad_info WHERE ad_keyword LIKE '%" + keyword + "%'" ;
		
		System.out.println("pop_upDTO / Find_ad / count :  " + sql);
		this.RunQuery(sql);
		if( this.GetNext() == false)
		{
			this.DBClose();
			return -1;
		}
// Ű����� �˻��� ������ ������ �޾ƿ´�
		int count = this.GetInt("count");
// count == 0 -> �� Ű����� �˻��� ���� ����
		if( count == 0)
		{
			this.DBClose();
			return 0;
		}

// count > 1 -> ������ ���� �˻���
// ��� ���� �������� ����
		
// coun == 1 -> ���� 1�� �˻���, �� ������ ������ �޾ƿ�
		if(count == 1)
		{
			sql  = "SELECT ad_no FROM ad_info WHERE ad_keyword LIKE '%" + keyword + "%'" ;
			System.out.println("pop_upDTO / Find_ad ad_no :  " + sql);
			this.RunQuery(sql);
			this.GetNext();
			
	
			int ad_no = this.GetInt("ad_no");
			
			this.DBClose();
			return ad_no;
		}
		this.DBClose();
		return -1;
		// -> Ű����� ���� �˻��ؼ� ������ ��ȣ�� ��ȯ
	}
}
