package cn.hengxin.controller;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.Random;

import javax.imageio.ImageIO;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.hengxin.dao.UserMapper;
import cn.hengxin.entity.User;
import cn.hengxin.service.IUserService;
import cn.hengxin.vo.LoginForm;

@Controller
public class UserController {
	
	@Autowired
	private IUserService userService;
	
	
	@RequestMapping("/login.action")
	public void loginAction(LoginForm loginForm,HttpServletResponse response,HttpSession session) throws IOException{
		   
		if(!loginForm.getVerifyCode().equalsIgnoreCase((String)session.getAttribute("verifyCode"))){
			response.getWriter().print("login002");
			return;
		}
			
		User user = new User(loginForm.getUsername(),loginForm.getPassword());
		user = userService.login(user);
		if(user==null){
			response.getWriter().print("login001");
			return;
		}
		session.setAttribute("user", user);
		response.getWriter().print("login000");
	}
	
	@RequestMapping("/console/logout.action")
	public String logoutAction(HttpSession session){
		session.invalidate();
		
		return "/front/login";
	}
	
	
	@RequestMapping("/console/updatePassword.action")
	public String update(User user,HttpSession session){
		
		int row = userService.updatePassword(user);
		session.removeAttribute("user");
		
		return "/front/login";
	}
	
	@RequestMapping("/getVerifyCode.action")
	public void getVerifyCode(HttpServletResponse response,HttpSession session) throws IOException{
		int width = 70,height=30,codeCount=4,fontHeight=0,xx=0,codeY=0;
		String[] codeSequence = { "1" , "2" , "3" , "4" , "5" ,"6","7","8","9","A","a","B","b","c","C"
				,"D","d","E","e","F","f","G","g","z","X","Q","v"};
		
		xx = width/(codeCount+3);
		fontHeight = height - 2;
		codeY = height-8;
		
		BufferedImage buffImg = new BufferedImage(width,height,
				BufferedImage.TYPE_INT_RGB);
		Graphics2D gd = buffImg.createGraphics();
		
		Random random = new Random();
		
		gd.setColor(Color.white);
		gd.fillRect(0, 0, width, height);
		
		Font font = new Font("Fixedsys",Font.PLAIN, fontHeight);
		
		gd.setFont(font);
		
		gd.setColor(Color.black);
		gd.drawRect(0, 0, width-1, height-1);
		gd.setColor(Color.black);
		
		for(int i=0;i<4;i++){
			int x = random.nextInt(width);
			int y = random.nextInt(height);
			int xl = random.nextInt(12);
			int yl = random.nextInt(12);
			gd.drawLine(x, y, x + xl, y + yl);
		}
		
		StringBuffer randomCode = new StringBuffer();    
		int red = 0, green = 0, blue = 0;
		
		for(int i=0;i<codeCount;i++){
	    	
	        String strRand = String.valueOf(codeSequence[random.nextInt(27)]);
	       
	        red = random.nextInt(125);
	        green = random.nextInt(255);
	        blue = random.nextInt(200);
	    
	       
	        gd.setColor(new Color(red, green, blue));
	        gd.drawString(strRand, (i + 1) * xx, codeY);
	    
	      
	        randomCode.append(strRand);
		}
		
		response.setHeader("Pragma", "no-cache");
	    response.setHeader("Cache-Control", "no-cache");
	    response.setDateHeader("Expires", 0);
	    response.setContentType("image/jpeg");
	    
	    ServletOutputStream sos = response.getOutputStream();
	    ImageIO.write(buffImg, "jpeg", sos);
	    sos.close();
	    
	    session.setAttribute("verifyCode", randomCode.toString());
	    System.out.println("verifyCode:"+randomCode.toString());
		
	}
	
}
