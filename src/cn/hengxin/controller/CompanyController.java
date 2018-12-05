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
	
	/* 处理图片上传及得到图片地址 */
	private Company companyImgHandler(Company company,HttpServletRequest request) throws IOException, NoSuchFieldException, SecurityException, IllegalArgumentException, IllegalAccessException{
		
		String realPath = servletContext.getRealPath("/upload");
			
		if(request instanceof MultipartHttpServletRequest){
		  MultipartHttpServletRequest multipartHttpServletRequest = (MultipartHttpServletRequest)request;
		  //获取上传文件
		  Map<String,MultipartFile> fileMap = multipartHttpServletRequest.getFileMap();
		  for(Map.Entry<String, MultipartFile> entry:fileMap.entrySet()){
			  //处理文件
			 
			  File saveFile = new File(realPath);
			  if(!saveFile.exists()){
					saveFile.mkdir();
			  }
			  /* 得到文件名  */
			  String filename = entry.getValue().getOriginalFilename();
			  filename = UUID.randomUUID().toString().replaceAll("-", "")+filename;
			  String savePath = realPath+"/"+filename;
			  
			  /* 利用反射机制为字段赋值 */
			  Field field = company.getClass().getDeclaredField(entry.getKey()+"Addr");
			  field.setAccessible(true);
			  field.set(company, servletContext.getContextPath()+"/upload/"+filename);
			  
			  FileOutputStream fos = new FileOutputStream(savePath);
			  
			  /* 创建一个缓冲区 */
			  byte buffer[] = new byte[1024];
			  /* 判断输入流中的数据是否已经读完的标志 */
			  int len = 0;
			  /* 获取item中的上传文件的输入流 */
			  InputStream is = entry.getValue().getInputStream();
			  while((len=is.read(buffer))>0){
				  fos.write(buffer,0,len);
			  }
			  /* 关闭输入流 */
			  is.close();
			  /* 关闭文件输出流 */
			  fos.close();
		  }
	  }
	  
	  System.out.println(company);
	  return company;
	}
}
