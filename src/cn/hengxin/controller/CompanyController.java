package cn.hengxin.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.lang.reflect.Field;
import java.util.Map;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import cn.hengxin.entity.Company;
import cn.hengxin.service.ICompanyService;

@Controller
public class CompanyController {
	
	@Autowired
	private ICompanyService companyService;
	@Autowired
	private ServletContext servletContext;
	
	@RequestMapping("/console/companyUpdate")
	public String companyUpdate(){
		return "/console/companyEdit";
	}
	
	@RequestMapping("/console/companyUpdate.action")
	public void companyUpdateAction(Company company,HttpServletRequest request,HttpServletResponse response) throws IOException, NoSuchFieldException, SecurityException, IllegalArgumentException, IllegalAccessException{
		
		company = companyImgHandler(company, request);
		
		int row = companyService.companyUpdate(company);
		
		if(row>0){
			servletContext.setAttribute("company", company);
			response.getWriter().print(
					"<script>"
					+"alert('success');"
					+"location.href='home';"
					+ "</script>"
					);
		}
			
		else{
			response.getWriter().print(
					"<script>"
					+"alert('fail');"
					+ "</script>"
					);
		}
	}
	
	/* ����ͼƬ�ϴ����õ�ͼƬ��ַ */
	private Company companyImgHandler(Company company,HttpServletRequest request) throws IOException, NoSuchFieldException, SecurityException, IllegalArgumentException, IllegalAccessException{
		
		String realPath = servletContext.getRealPath("/upload");
			
		if(request instanceof MultipartHttpServletRequest){
		  MultipartHttpServletRequest multipartHttpServletRequest = (MultipartHttpServletRequest)request;
		  //��ȡ�ϴ��ļ�
		  Map<String,MultipartFile> fileMap = multipartHttpServletRequest.getFileMap();
		  for(Map.Entry<String, MultipartFile> entry:fileMap.entrySet()){
			  //�����ļ�
			 
			  File saveFile = new File(realPath);
			  if(!saveFile.exists()){
					saveFile.mkdir();
			  }
			  /* �õ��ļ���  */
			  String filename = entry.getValue().getOriginalFilename();
			  filename = UUID.randomUUID().toString().replaceAll("-", "")+filename;
			  String savePath = realPath+"/"+filename;
			  
			  /* ���÷������Ϊ�ֶθ�ֵ */
			  Field field = company.getClass().getDeclaredField(entry.getKey()+"Addr");
			  field.setAccessible(true);
			  field.set(company, servletContext.getContextPath()+"/upload/"+filename);
			  
			  FileOutputStream fos = new FileOutputStream(savePath);
			  
			  /* ����һ�������� */
			  byte buffer[] = new byte[1024];
			  /* �ж��������е������Ƿ��Ѿ�����ı�־ */
			  int len = 0;
			  /* ��ȡitem�е��ϴ��ļ��������� */
			  InputStream is = entry.getValue().getInputStream();
			  while((len=is.read(buffer))>0){
				  fos.write(buffer,0,len);
			  }
			  /* �ر������� */
			  is.close();
			  /* �ر��ļ������ */
			  fos.close();
		  }
	  }
	  
	  System.out.println(company);
	  return company;
	}
}
