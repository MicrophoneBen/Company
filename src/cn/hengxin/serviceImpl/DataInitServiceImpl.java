package cn.hengxin.serviceImpl;

import java.util.List;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.InitializingBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.context.ServletContextAware;

import cn.hengxin.dao.CaseMapper;
import cn.hengxin.dao.CompanyMapper;
import cn.hengxin.dao.CoreMapper;
import cn.hengxin.dao.NewsMapper;
import cn.hengxin.dao.ServiceMapper;
import cn.hengxin.dao.UserMapper;
import cn.hengxin.entity.Company;
import cn.hengxin.service.IDataInitService;

@Service
@Transactional
public class DataInitServiceImpl implements IDataInitService,InitializingBean,ServletContextAware{

	@Autowired
	private UserMapper userMapper;
	@Autowired
	private CompanyMapper companyMapper;
	@Autowired
	private NewsMapper newsMapper;
	@Autowired
	private ServiceMapper serviceMapper;
	@Autowired
	private CoreMapper coreMapper;
	@Autowired
	private CaseMapper caseMapper;
	
	@Override
	public void setServletContext(ServletContext servletContext) {
		// 数据准备写在这里
		System.out.println("Begin to initialize data!");
		
		/* 检查公司资料 */
		List<Company> companyList = companyMapper.listCompany();
		if(companyList.size()>0){//存在公司资料
			servletContext.setAttribute("company", companyList.get(0));
		}else{
			/* 无资料则插入一条信息 */
			Company company = new Company();
			company.setCompanyName("company_name");
			company.setAddress("company_address");
			company.setContent("this is content!");
			company.setEmail("test@test.com");
			company.setTelephone("000-000000");
			company.setLogoAddr("assets/images/logo.png");
			
			companyMapper.insertCompany(company);
			servletContext.setAttribute("company",companyMapper.listCompany().get(0));
		}
		
		/* 准备轮播新闻和最新新闻 */
		servletContext.setAttribute("latestNews", newsMapper.listLatestNews());
		servletContext.setAttribute("carousel", newsMapper.listCarousel());
		
		/* 准备产品与服务数据 */
		servletContext.setAttribute("intelligentVideo", serviceMapper.listServiceByType("intelligentVideo"));
		servletContext.setAttribute("authentication", serviceMapper.listServiceByType("authentication"));
		servletContext.setAttribute("internet", serviceMapper.listServiceByType("internet"));
		servletContext.setAttribute("other", serviceMapper.listServiceByType("other"));
		
		/* 准备核心技术数据  */
		servletContext.setAttribute("cores", coreMapper.listCore());
		
		/* 准备客户数据 */
		servletContext.setAttribute("clients", caseMapper.listCase());
	}

	@Override
	public void afterPropertiesSet() throws Exception {
		
	}

	@Override
	public void initialize() {
		
		
	}

}
