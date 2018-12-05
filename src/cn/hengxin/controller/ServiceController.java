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
import cn.hengxin.entity.Service;
import cn.hengxin.service.IServiceService;

@Controller
public class ServiceController {

	@Autowired
	private IServiceService serviceService;
	@Autowired
	private ServletContext servletContext;
	
	@RequestMapping("/console/serviceRelease")
	public String serviceRelease(Model model){
		
		model.addAttribute("serviceAction", "serviceRelease");
		
		return "/console/serviceEdit";
	}
	
	@RequestMapping("/console/serviceManage")
	public String serviceManage(Model model){
		  
		model.addAttribute("serviceList",serviceService.listService());
		
		return "/console/serviceManage";
	}
	
	@RequestMapping("/console/serviceUpdate")
	public String serviceUpdate(Integer id,Model model){
		
		model.addAttribute("serviceAction", "serviceUpdate");
		model.addAttribute("service",serviceService.getService(id));
		
		return "/console/serviceEdit";
	}
	
	@RequestMapping("/console/serviceUpdate.action")
	public void serviceUpdateAction(Service service,HttpServletRequest request,HttpServletResponse response) throws NoSuchFieldException, SecurityException, IllegalArgumentException, IllegalAccessException, IOException{
		service = serviceImgHandler(service,request);
		int row = serviceService.serviceUpdate(service);
		
		 if(row>0){
			 servletContext.setAttribute("intelligentVideo", serviceService.listServiceByType("intelligentVideo"));
			 servletContext.setAttribute("authentication", serviceService.listServiceByType("authentication"));
			 servletContext.setAttribute("internet", serviceService.listServiceByType("internet"));
			 servletContext.setAttribute("other", serviceService.listServiceByType("other"));
			 response.getWriter().print("success");
		 }
			 
		  else
			  response.getWriter().print("fail");
	}
	
	
	@RequestMapping("/console/serviceDelete.action")
	public void serviceDeleteAction(Integer id,HttpServletResponse response) throws IOException{
		
		int row = serviceService.deleteService(id);
		
		if(row>0){
			servletContext.setAttribute("intelligentVideo", serviceService.listServiceByType("intelligentVideo"));
			servletContext.setAttribute("authentication", serviceService.listServiceByType("authentication"));
			servletContext.setAttribute("internet", serviceService.listServiceByType("internet"));
			servletContext.setAttribute("other", serviceService.listServiceByType("other"));
			response.getWriter().print(
					"<script>"
					+"alert('success');"
					+"location.href='serviceManage';"
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
	
	@RequestMapping("/console/serviceRelease.action")
	public void serviceReleaseAction(Service service,HttpServletRequest request,HttpServletResponse response) throws IOException, NoSuchFieldException, SecurityException, IllegalArgumentException, IllegalAccessException{
		  
		  service = serviceImgHandler(service, request);
		  int row = serviceService.serviceRelease(service);
		  
		  if(row>0){
			  servletContext.setAttribute("intelligentVideo", serviceService.listServiceByType("intelligentVideo"));
			  servletContext.setAttribute("authentication", serviceService.listServiceByType("authentication"));
			  servletContext.setAttribute("internet", serviceService.listServiceByType("internet"));
			  servletContext.setAttribute("other", serviceService.listServiceByType("other"));
			  response.getWriter().print("success");
		  }
		  else
			  response.getWriter().print("fail");
	}
	
	/* 处理图片上传及得到图片地址 */
	private Service serviceImgHandler(Service service,HttpServletRequest request) throws IOException, NoSuchFieldException, SecurityException, IllegalArgumentException, IllegalAccessException{
		
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
			  Field field = service.getClass().getDeclaredField(entry.getKey()+"Addr");
			  field.setAccessible(true);
			  field.set(service, servletContext.getContextPath()+"/upload/"+filename);
			  
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
	  
	  System.out.println(service);
	  return service;
	}
	
}
