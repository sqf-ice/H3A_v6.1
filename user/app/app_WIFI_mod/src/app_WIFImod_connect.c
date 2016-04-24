/*********************************************************************************************
*            �麣�����������޹�˾
*            http://www.zhkh.com
* ģ������: ���� ����ģ��������Ӳ�
* ����ʱ��:2010-09-19
* ������˾ :����
* �ļ�����:app_WIFImod_connect.c
* ������ :�ҳ�
* ��������:ʵ�ָ�ģ��Ķ�������
*-------------------------------------------------------------------*/
#include"app_WIFImod_inside.h"
/********************************************************************
 * @������ :�ҳ�
 * @���� : ϵͳ����ģ����Դ��ʼ��
 *
 * @���� :NONE
 *
 *@���  :NONE
********************************************************************/
void app_WIFImod_resource_init( void )
{
	return;
}
/********************************************************************
 * @������ :�ҳ�
 * @���� : ģ��������
 *
 * @���� :NONE
 *
 *@���  :NONE
********************************************************************/
void app_WIFImod_insmod( void )
{
	app_global_resouce_req( 0 );  	/*����ռ�ù�����Դ*/
	app_WIFImod_resource_init();		/*��ʼ����ģ����Դ*/
	app_WIFImod_fun_entry();    		/*��ģ�����������*/
	DBGMSG( "WIFImod....\n", LOG_NP, LOG_NP );
	return;
}
/********************************************************************
 * @������ :�ҳ�
 * @���� : ģ��ж�����
 *
 * @���� :NONE
 *
 *@���  :NONE
********************************************************************/
void app_WIFImod_exit( void )
{
	app_global_resouce_release( 0 );/*�ͷ�ռ�ù�����Դ*/
	app_WIFImod_fun_exit();			/*�˳���ģ��������*/
	return;
}
/********************************************************************
 * @������ :�ҳ�
 * @���� : ��ģ��ӵ������б�
 *
 * @���� :NONE
 *
 *@���  :NONE
********************************************************************/
Bsize_t app_WIFImod_add( void )
{
	app_mod_inlet_t temp;
	Bsize_t mod_id;
	temp.insmod_fun 	= app_WIFImod_insmod;/*ģ�����*/
	temp.exitmod_fun 	= app_WIFImod_exit;/*ģ�����*/
	mod_id = app_module_add( &temp );
	return mod_id;
}