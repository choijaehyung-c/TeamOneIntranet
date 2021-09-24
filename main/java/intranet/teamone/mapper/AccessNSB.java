package intranet.teamone.mapper;

public interface AccessNSB {
   void getAccessHistorySum();
   void getLogOutAccessHistorySum();
   void getLastAccessInfo();
   void forceLogout();
   void isUserId();
   void checkPwd();
   void insAccessHistoryIntranet();
}