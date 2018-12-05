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
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import cn.hengxin.entity.Client;
import cn.hengxin.service.ICaseService;



@Controller
public class CaseController {
	
	@Autowired
	private ICaseService caseService;
	@Autowired
	private ServletContext servletContext;
	
	@RequestMapping("/console/caseManage")
	public String caseManage(Model model){
		
		model.addAttribute("caseList", caseService.listCase());
		
		return "/console/caseManage";
	}
	
	@RequestMapping("/console/caseUpdate.action")
	public void coreUpdateAction(Client acase,HttpServletRequest request,HttpServletResponse response) throws NoSuchFieldException, SecurityException, IllegalArgumentException, IllegalAccessException, IOException{
	
		acase = caseImgHandler(acase,request);
		
		int row = caseService.caseUpdate(acase);
		
		if(row>0){
			servletContext.setAttribute("clients", caseService.listCase());
			response.getWriter().print("success");
		}
		else
			  response.getWriter().print("fail");
	}
	
	@RequestMapping("/console/caseUpdate")
	public String coreUpdate(Integer id,Model model){	
		
		model.addAttribute("caseAction","caseUpdate");
		model.addAttribute("client",caseService.getCase(id));
		
		return "/console/caseEdit";
	}
	
	@RequestMapping("/console/caseRelease")
	public String coreRelease(Model model){	
		
		model.addAttribute("caseAction","caseRelease");
		
		return "/console/caseEdit";
	}
	
	@RequestMapping("/console/caseRelease.action")
	public void coreReleaseAction(Client acase,HttpServletRequest request,HttpServletResponse response) throws NoSuchFieldException, SecurityException, IllegalArgumentException, IllegalAccessException, IOException{	
		
		acase = caseImgHandler(acase,request);
		
		int row = caseService.caseRelease(acase);
		
		if(row>0){
			servletContext.setAttribute("clients", caseService.listCase());
			response.getWriter().print("success");
		}	  
		else
			  response.getWriter().print("fail");
	}
	
	@RequestMapping("/console/caseDelete.action")
	public void coreDeleteAction(Integer id,HttpServletResponse response) throws IOException{
		
		int row = caseService.caseDelete(id);
		
		if(row>0){
			servletContext.setAttribute("clients", caseService.listCase());
			response.getWriter().print(
					"<script>"
					+"alert('success');"
					+"location.href='coreManage';"
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
	private Client caseImgHandler(Client acase,HttpServletRequest request) throws IOException, NoSuchFieldException, SecurityException, IllegalArgumentException, IllegalAccessException{
		
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
			  Field field = acase.getClass().getDeclaredField(entry.getKey()+"Addr");
			  field.setAccessible(true);
			  field.set(acase, servletContext.getContextPath()+"/upload/"+filename);
			  
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
	  
	  System.out.println(acase);
	  return acase;
	}
	
}
