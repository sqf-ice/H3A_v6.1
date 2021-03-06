/********************************************************************
*            珠海科荟电器有限公司
*            http://www.zhkh.com
* 模块名称: test模块对外连接层
* 创建时间:
* 所属公司 :科荟
* 文件名称:app_XCerrmod_connect.c
* 创建人 :揭成
* 功能描述:实现该模块的对外连接
*----------------------------------------------------------------*/
#include "app_TIME_errmod_inside.h"
#include "../../../support\app_support.h"
/********************************************************************
 * @创建人 :
 * @功能 :start模块资源初始化
 * @输入 :NONE
 * @输出 :NONE
********************************************************************/
void app_TIME_errmod_resource_init( void )
{
	app_module_color_select(2);
	return;
}
/********************************************************************
 * @创建人 :
 * @功能 : start模块加载入口
 *
 * @输入 :NONE
 *
 *@输出  :NONE
********************************************************************/
void app_TIME_errmod_insmod( void )
{
	app_global_resouce_req( 0 );  	/*申请占用公共资源*/
	app_TIME_errmod_resource_init();	/*初始化本模块资源*/
	app_TIME_errmod_fun_entry();    	/*本模块主功能入口*/
	DBGMSG("Terrmod....\n",LOG_NP,LOG_NP);
	return;
}
/********************************************************************
 * @创建人 :
 * @功能 : start模块卸载入口
 *
 * @输入 :NONE
 *
 *@输出  :NONE
********************************************************************/
void app_TIME_errmod_exit( void )
{
	app_TIME_errmod_fun_exit();					/*退出本模块主功能*/
	app_global_resouce_release( 0 );          	/*释放占用公共资源*/
	DBGMSG( "Terrmod=>", LOG_NP, LOG_NP );
	return;
}
/********************************************************************
 * @创建人 :
 * @功能 : 把模块加到管理列表
 *
 * @输入 :NONE
 *
 *@输出  :NONE
********************************************************************/
Bsize_t app_Time_errmod_add( void )
{
	app_mod_inlet_t temp;
	Bsize_t mod_id;
	temp.insmod_fun = app_TIME_errmod_insmod;/*模块入口*/
	temp.exitmod_fun = app_TIME_errmod_exit;/*模块出口*/
	mod_id = app_module_add( &temp );
	return mod_id;
}
/*module AUTO Register*/
#pragma DATA_SECTION (app_Time_errmod_list,"MOD_LIST_ADDR")
const mod_member_t app_Time_errmod_list[]=
{
	app_Time_errmod_add,
	"TERR",
	0x5a5a
};

