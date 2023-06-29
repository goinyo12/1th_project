//����Ʈ ���� Ŭ����

package kickoff.dto;

import kickoff.dao.*;
import kickoff.vo.*;
import java.util.*;

public class ListDTO extends DBManager
{
	//type�� ���� �Խù� ���� �ҷ�����
	public int GetTotal(String type,String mcate,String keyword,String search_type)
	{
		this.DBOpen();
		
		String sql = "";
		
		sql  = "select count(*) as total  ";
		sql += "from post ";
		sql += "where post_type='" + type + "' ";
		
		if(mcate.equals("a"))
		{
			sql += "and post_no>1 ";
		}
		else
		{
			sql += "and post_mcate = '" + mcate + "' ";
		}
		//���񿡼� �˻�
		if(!keyword.equals("") && !search_type.equals("s_all"))
		{
			search_type = search_type.replace("s_", "");
			sql += "and " + search_type + " like '%" + _R(keyword) + "%' ";
		}
		else if(!keyword.equals("") && search_type.equals("s_all"))
		{	
			sql += "and (post_title like '%" + _R(keyword) + "%' or post_note like '%" + _R(keyword) + "%') ";
		}
		
		this.RunQuery(sql);
		this.GetNext();				
		int total = Integer.parseInt(this.GetValue("total")); //��ü ������ ����
	
		this.DBClose();
		
		return total;
	
	}

	
	//���� �Խù� ���� �ҷ�����
	public int GetVideoTotal(String mcate,String scate,String keyword,String search_type)
	{
		this.DBOpen();
		
		String sql = "";
		
		sql  = "select count(*) as total  ";
		sql += "from post ";
		sql += "where post_type='v' ";
		
		if(mcate.equals("a"))
		{
			sql += "and post_no>1 ";
		}
		else
		{
			if(scate.equals("a"))
			{
				sql += "and post_mcate='" + mcate + "' ";
			}
			else
			{
				sql += "and post_mcate='" + mcate + "' ";
				sql += "and post_scate='" + scate + "' ";
			}
		}
		//���񿡼� �˻�
		if(!keyword.equals("") && !search_type.equals("s_all"))
		{
			search_type = search_type.replace("s_", "");
			sql += "and " + search_type + " like '%" + _R(keyword) + "%' ";
		}
		else if(!keyword.equals("") && search_type.equals("s_all"))
		{	
			sql += "and (post_title like '%" + _R(keyword) + "%' or post_note like '%" + _R(keyword) + "%') ";
		}

		this.RunQuery(sql);
		this.GetNext();				
		int total = Integer.parseInt(this.GetValue("total")); //��ü ������ ����
		
		this.DBClose();
		return total;
	}
	
	//������������ �ҷ�����
	public int GetUserTotal()
	{
		this.DBOpen();
		
		String sql = "";
		
		sql  = "select count(*) as total  ";
		sql += "from userinfo ";

		this.RunQuery(sql);
		this.GetNext();				
		int total = Integer.parseInt(this.GetValue("total")); //��ü ������ ����
		
		this.DBClose();
		return total;
	}
	
	//��������Ʈ �ҷ�����
	public ArrayList<PostVO> GetNewsList(int list_count,int pageno,String mcate,String sort,String keyword,String search_type)
	{
		ArrayList<PostVO> list = new ArrayList<PostVO>();
		
		this.DBOpen();
		
		String sql = "";
		
		sql  = "select post_no,post_title,post_note,date(post_date) as post_date,post_view,post_oname,post_pname,post_source,";
		sql += "(select user_name from userinfo where user_no = post.user_no) as user_name, ";
		sql += "(select user_nick from userinfo where user_no = post.user_no) as user_nick, ";
		sql += "(select count(*) from reply where post_no = post.post_no) as reply_count, ";
		sql += "(select count(*) from like_hate where post_no = post.post_no and like_hate = 'l') as like_count ";
		sql += "from post ";
		sql += "where post_type='n' ";
		
		if(mcate.equals("a"))
		{
			sql += "and post_no>=1 ";
		}
		else
		{
			sql += "and post_mcate='" + mcate + "' ";
		}
		
		//�˻�
		if(!keyword.equals("") && !search_type.equals("s_all"))
		{
			search_type = search_type.replace("s_", "");
			sql += "and " + search_type + " like '%" + _R(keyword) + "%' ";
		}
		else if(!keyword.equals("") && search_type.equals("s_all"))
		{	
			sql += "and (post_title like '%" + _R(keyword) + "%' or post_note like '%" + _R(keyword) + "%') ";
		}
		
		//�ֽ�,�α�,���ƿ��
		if(sort.equals("r"))
		{
			sql += "order by post_no desc ";
		}
		if(sort.equals("v"))
		{
			sql += "order by post_view desc, post_no desc ";
		}
		if(sort.equals("p"))
		{
			sql += "order by like_count desc, post_no desc ";
		}
		
		int startno = list_count * (pageno - 1);
		sql += "limit " + startno + ", " + list_count;		
		this.RunQuery(sql);
		while(this.GetNext() == true)
		{
			PostVO vo = new PostVO();
			vo.setPost_no(this.GetValue("post_no"));
			vo.setPost_title(this.GetValue("post_title"));
			vo.setPost_source(this.GetValue("post_source"));
			vo.setPost_note(this.GetValue("post_note"));
			vo.setPost_date(this.GetValue("post_date"));
			vo.setPost_view(this.GetValue("post_view"));
			vo.setPost_oname(this.GetValue("post_oname"));
			vo.setUser_name(this.GetValue("user_name"));
			vo.setUser_nick(this.GetValue("user_nick"));
			vo.setReply_count(this.GetValue("reply_count"));
			vo.setLike_count(this.GetValue("like_count"));
			
			list.add(vo);
		}		
		this.DBClose();
		
		return list;
	}
	
	//���󸮽�Ʈ �ҷ�����
	public ArrayList<PostVO> GetVideoList(int list_count,int pageno,String mcate,String scate,String sort,String keyword,String search_type)
	{
		ArrayList<PostVO> list = new ArrayList<PostVO>();
		
		this.DBOpen();
		
		String sql = "";
		
		sql  = "select post_no,post_title,post_note,date(post_date) as post_date,post_view,post_oname,post_pname,post_video,";
		sql += "(select user_name from userinfo where user_no = post.user_no) as user_name, ";
		sql += "(select user_nick from userinfo where user_no = post.user_no) as user_nick, ";
		sql += "(select count(*) from reply where post_no = post.post_no) as reply_count, ";
		sql += "(select count(*) from like_hate where post_no = post.post_no and like_hate = 'l') as like_count ";
		sql += "from post ";
		sql += "where post_type='v' ";
		
		if(mcate.equals("a"))
		{
			sql += "and post_no>=1 ";
		}
		else
		{
			if(scate.equals("a"))
			{
				sql += "and post_mcate='" + mcate + "' ";
			}
			else
			{
				sql += "and post_mcate='" + mcate + "' ";
				sql += "and post_scate='" + scate + "' ";
			}
		}
		
		//�˻�
		if(!keyword.equals("") && !search_type.equals("s_all"))
		{
			search_type = search_type.replace("s_", "");
			sql += "and " + search_type + " like '%" + _R(keyword) + "%' ";
		}
		else if(!keyword.equals("") && search_type.equals("s_all"))
		{	
			sql += "and (post_title like '%" + _R(keyword) + "%' or post_note like '%" + _R(keyword) + "%') ";
		}
		
		//�ֽ�,�α�,���ƿ��
		if(sort.equals("r"))
		{
			sql += "order by post_no desc ";
		}
		if(sort.equals("v"))
		{
			sql += "order by post_view desc, post_no desc ";
		}
		if(sort.equals("p"))
		{
			sql += "order by like_count desc, post_no desc ";
		}
		
		int startno = list_count * (pageno - 1);
		sql += "limit " + startno + ", " + list_count;	
		this.RunQuery(sql);
		while(this.GetNext() == true)
		{
			PostVO vo = new PostVO();
			vo.setPost_no(this.GetValue("post_no"));
			vo.setPost_title(this.GetValue("post_title"));
			vo.setPost_note(this.GetValue("post_note"));
			vo.setPost_date(this.GetValue("post_date"));
			vo.setPost_view(this.GetValue("post_view"));
			vo.setPost_oname(this.GetValue("post_oname"));
			vo.setPost_video(this.GetValue("post_video"));
			vo.setUser_name(this.GetValue("user_name"));
			vo.setUser_nick(this.GetValue("user_nick"));
			vo.setReply_count(this.GetValue("reply_count"));
			vo.setLike_count(this.GetValue("like_count"));
			
			list.add(vo);
		}		
		this.DBClose();
		
		return list;
	}
	
	//�Խ��� ����Ʈ �ҷ�����
	public ArrayList<PostVO> GetBoardList(int list_count,int pageno,String mcate,String sort,String keyword,String search_type)
	{
		ArrayList<PostVO> list = new ArrayList<PostVO>();
		
		this.DBOpen();
		
		String sql = "";
		
		sql  = "select post_no,post_title,post_note,date(post_date) as post_date,post_view,post_oname,post_pname,post_blind,";
		sql += "(select user_name from userinfo where user_no = post.user_no) as user_name, ";
		sql += "(select user_nick from userinfo where user_no = post.user_no) as user_nick, ";
		sql += "(select count(*) from reply where post_no = post.post_no) as reply_count, ";
		sql += "(select count(*) from like_hate where post_no = post.post_no and like_hate = 'l') as like_count ";
		sql += "from post ";
		sql += "where post_type='b' ";
		
		if(mcate.equals("a"))
		{
			sql += "and post_no>=1 ";
		}
		else
		{
			sql += "and post_mcate='" + mcate + "' ";
		}
		
		//�˻�
		if(!keyword.equals("") && !search_type.equals("s_all"))
		{
			search_type = search_type.replace("s_", "");
			sql += "and " + search_type + " like '%" + _R(keyword) + "%' ";
		}
		else if(!keyword.equals("") && search_type.equals("s_all"))
		{	
			sql += "and (post_title like '%" + _R(keyword) + "%' or post_note like '%" + _R(keyword) + "%') ";
		}
		
		//�ֽ�,�α�,���ƿ��
		if(sort.equals("r"))
		{
			sql += "order by post_no desc ";
		}
		if(sort.equals("v"))
		{
			sql += "order by post_view desc, post_no desc ";
		}
		if(sort.equals("p"))
		{
			sql += "order by like_count desc, post_no desc ";
		}
		
		int startno = list_count * (pageno - 1);
		sql += "limit " + startno + ", " + list_count;		
		this.RunQuery(sql);
		while(this.GetNext() == true)
		{
			PostVO vo = new PostVO();
			vo.setPost_no(this.GetValue("post_no"));
			vo.setPost_title(this.GetValue("post_title"));
			vo.setPost_note(this.GetValue("post_note"));
			vo.setPost_blind(this.GetValue("post_blind"));
			vo.setPost_date(this.GetValue("post_date"));
			vo.setPost_view(this.GetValue("post_view"));
			vo.setUser_name(this.GetValue("user_name"));
			vo.setUser_nick(this.GetValue("user_nick"));
			vo.setReply_count(this.GetValue("reply_count"));
			vo.setLike_count(this.GetValue("like_count"));
			list.add(vo);
		}
		
		this.DBClose();
		
		return list;
	}
	
	//���� ����Ʈ �ҷ�����
	public ArrayList<UserinfoVO> GetUserList(int list_count,int pageno)
	{
		ArrayList<UserinfoVO> list = new ArrayList<UserinfoVO>();
		
		this.DBOpen();
		
		String sql = "";
		
		sql  = "select user_no,user_name,user_grade,user_gender,user_id,user_nick,user_mail,user_date,user_exit from userinfo ";
		
		int startno = list_count * (pageno - 1);
		sql += "limit " + startno + ", " + list_count;
		
		this.RunQuery(sql);
		while(this.GetNext() == true)
		{
			UserinfoVO vo = new UserinfoVO();
			vo.setUser_no(this.GetValue("user_no"));
			vo.setUser_id(this.GetValue("user_id"));
			vo.setUser_name(this.GetValue("user_name"));
			vo.setUser_nick(this.GetValue("user_nick"));
			vo.setUser_mail(this.GetValue("user_mail"));
			vo.setUser_gender(this.GetValue("user_gender"));
			vo.setUser_date(this.GetValue("user_date"));
			vo.setUser_grade(this.GetValue("user_grade"));
			vo.setUser_exit(this.GetValue("user_exit"));
			
			list.add(vo);
		}		
		this.DBClose();
		
		return list;
	}
}
