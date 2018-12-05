package cn.hengxin.service;

import java.util.List;
import cn.hengxin.entity.Core;

public interface ICoreService {

	List<Core> listCore();
	Core getCore(Integer id);
	int coreRelease(Core core);
	int coreUpdate(Core core);
	int coreDelete(Integer id);

}
