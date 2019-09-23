package controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.util.FileCopyUtils;
import org.springframework.web.servlet.view.AbstractView;

public class DownloadView extends AbstractView{

	private File file;
	
	public DownloadView(File file) {
		setContentType("application/download; utf-8");//다운받을수 있는 객체로 타입을 만들어 준다
		this.file = file;
	}
	@Override
	protected void renderMergedOutputModel(Map<String, Object> model, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		//응답 객체 컨텐츠 타입/ 길이 설정
		//특정 파일을 실어서 넘겨야하므로 response객체를 사용한다
		response.setContentType(getContentType());//생성자에 타입 맞춰준거를 가져온다
		response.setContentLength((int)file.length());//long타입이라 int로 바꿔준다
		
		String userAgent = request.getHeader("User-Agent");
		boolean ie = userAgent.indexOf("MSIE") > -1;
		
		String filename = null;
		if(ie) {
			filename = URLEncoder.encode(file.getName(),"utf-8");
		}else {
			filename = new String(file.getName().getBytes("utf-8"));
		}
		
		response.setHeader("Content-Disposition", "attachment;filename=\""+filename+"\";");
		response.setHeader("Content-Transfer-Encoding", "binary");
		
		OutputStream out = response.getOutputStream();
		FileInputStream fis = null;
		try {
			fis = new FileInputStream(file);
			FileCopyUtils.copy(fis, out);
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(fis != null) fis.close();
		}
		out.flush();
	}

}
