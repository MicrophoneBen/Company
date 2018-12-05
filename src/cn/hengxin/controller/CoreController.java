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

import cn.hengxin.entity.Core;
import cn.hengxin.service.ICoreService;


@Controller
public class CoreController {
	
	@Autowired
	private ICoreService coreService;
	@Autowired
	private ServletContext servletContext;
	
	@RequestMapping("/console/coreManage")
	public String coreManage(Model model){
		
		model.addAttribute("coreList", coreService.listCore());
		
		return "/console/coreManage";
	}
	
	@RequestMapping("/console/coreUpdate.action")
	public void coreUpdateAction(Core core,HttpServletRequest request,HttpServletResponse response) throws NoSuchFieldException, SecurityException, IllegalArgumentException, IllegalAccessException, IOException{
	
		core = coreImgHandler(core,request);
		
		int row = coreService.coreUpdate(core);
		
		if(row>0){
			servletContext.setAttribute("cores", coreService.listCore());
			response.getWriter().print("success");
		}
			  
		else
			  response.getWriter().print("fail");
	}
	
	@RequestMapping("/console/coreUpdate")
	public String coreUpdate(Integer id,Model model){	
		
		model.addAttribute("coreAction","coreUpdate");
		model.addAttribute("core",coreService.getCore(id));
		
		return "/console/coreEdit";
	}
	
	@RequestMapping("/console/coreRelease")
	public String coreRelease(Model model){	
		
		model.addAttribute("coreAction","coreRelease");
		
		return "/console/coreEdit";
	}
	
	@RequestMapping("/console/coreRelease.action")
	public void coreReleaseAction(Core core,HttpServletRequest request,HttpServletResponse response) throws NoSuchFieldException, SecurityException, IllegalArgumentException, IllegalAccessException, IOException{	
		
		core = coreImgHandler(core,request);
		
		int row = coreService.coreRelease(core);
		
		if(row>0){
			servletContext.setAttribute("cores", coreService.listCore());
			response.getWriter().print("success");
		}	  
		else
			  response.getWriter().print("fail");
	}
	
	@RequestMapping("/console/coreDelete.action")
	public void coreDeleteAction(Integer id,HttpServletResponse response) throws IOException{
		
		int row = coreService.coreDelete(id);
		
		if(row>0){
			servletContext.setAttribute("cores", coreService.listCore());
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
	
	/* ����ͼƬ�ϴ����õ�ͼƬ��ַ */
	private Core coreImgHandler(Core core,HttpServletRequest request) throws IOException, NoSuchFieldException, SecurityException, IllegalArgumentException, IllegalAccessException{
		
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
			  Field field = core.getClass().getDeclaredField(entry.getKey()+"Addr");
			  field.setAccessible(true);
			  field.set(core, servletContext.getContextPath()+"/upload/"+filename);
			  
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
	  
	  System.out.println(core);
	  return core;
	}
	
}
