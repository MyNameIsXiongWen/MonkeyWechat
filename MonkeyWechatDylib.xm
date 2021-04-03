// See http://iphonedevwiki.net/index.php/Logos

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@interface LLRedEnvelopParam : NSObject
- (NSDictionary *)toParams;
@property (strong, nonatomic) NSString *msgType;
@property (strong, nonatomic) NSString *sendId;
@property (strong, nonatomic) NSString *channelId;
@property (strong, nonatomic) NSString *nickName;
@property (strong, nonatomic) NSString *headImg;
@property (strong, nonatomic) NSString *nativeUrl;
@property (strong, nonatomic) NSString *sessionUserName;
@property (strong, nonatomic) NSString *timingIdentifier;
@end
@implementation LLRedEnvelopParam
- (NSDictionary *)toParams {
    return @{
    @"msgType": self.msgType,
    @"sendId": self.sendId,
    @"channelId": self.channelId,
    @"nickName": self.nickName,
    @"headImg": self.headImg,
    @"nativeUrl": self.nativeUrl,
    @"sessionUserName": self.sessionUserName,
    @"timingIdentifier": self.timingIdentifier
    };
}
@end


@interface LLRedManager : NSObject
@property (nonatomic, strong) NSMutableArray *array;
//是否自动抢红包
@property (nonatomic, assign) BOOL isAutoRed;
@property (nonatomic, assign) NSInteger stepCount;
@property (nonatomic, copy) NSString *masssendContent;
+(instancetype) sharedInstance;
//添加对象
-(void) addParams:(LLRedEnvelopParam *) params;
//获得对象
- (LLRedEnvelopParam *) getParams:(NSString *) sendId;
- (void)handleStepCount:(UITextField *)tf;
@end

@implementation LLRedManager
+(instancetype) sharedInstance{
    static LLRedManager *_instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [[LLRedManager alloc] init];
    });
    return _instance;
}

-(instancetype)init{
    if (self = [super init]){
        _array = [[NSMutableArray alloc] init];
    }
    return self;
}

//添加对象
-(void) addParams:(LLRedEnvelopParam *) params{
    @synchronized(self) {
        [_array addObject:params];
    }
}
//获得对象
- (LLRedEnvelopParam *) getParams:(NSString *) sendId{
    @synchronized(self) {
        NSInteger resultIndex = -1;
        for (NSInteger index = 0 ; index < self.array.count ; index++) {
            LLRedEnvelopParam *params = self.array[index];
            if ([params.sendId isEqualToString:sendId]){ //找到了
                resultIndex = index;
            }
        }
        if (resultIndex != -1 ){
            LLRedEnvelopParam *params = self.array[resultIndex];
            [self.array removeObjectAtIndex:resultIndex];
            return params;
        }
        return nil;
    }
}
//控制设置开关
- (void)handleRedSwitch{
    self.isAutoRed = !self.isAutoRed;
}

- (void)handleStepCount:(UITextField *)tf {
    self.stepCount = [tf.text integerValue];
    self.masssendContent = tf.text;
}

- (NSString *)masssendContent {
    if (!_masssendContent) {
        return @"测试群发功能";
    }
    return _masssendContent;
}

@end

@interface WCBizUtil
+ (id)dictionaryWithDecodedComponets:(id)arg1 separator:(id)arg2;
@end

@interface WCPayInfoItem
@property(copy, nonatomic) NSString *m_c2cNativeUrl;
@end

@interface CMessageWrap
@property(retain, nonatomic) WCPayInfoItem *m_oWCPayInfoItem;
@property(nonatomic) unsigned int m_uiMessageType; // @synthesize m_uiMessageType;
@property(retain, nonatomic) NSString *m_nsMsgSource; // @synthesize m_nsMsgSource;
@property(retain, nonatomic) NSString *m_nsBizChatId; // @synthesize m_nsBizChatId;
@property(retain, nonatomic) NSString *m_nsBizClientMsgID; // @synthesize m_nsBizClientMsgID;
@property(retain, nonatomic) NSString *m_nsContent; // @synthesize m_nsContent;
@property(retain, nonatomic) NSString *m_nsToUsr; // @synthesize m_nsToUsr;
@property(retain, nonatomic) NSString *m_nsFromUsr; // @synthesize m_nsFromUsr;
@property(retain, nonatomic) NSString *m_nsAtUserList; // @synthesize m_nsAtUserList;
@property(retain, nonatomic) NSString *m_nsKFWorkerOpenID; // @synthesize m_nsKFWorkerOpenID;
@property(retain, nonatomic) NSString *m_nsDisplayName; // @synthesize m_nsDisplayName;
@property(retain, nonatomic) NSString *m_nsPattern; // @synthesize m_nsPattern;
@property(retain, nonatomic) NSString *m_nsRealChatUsr; // @synthesize m_nsRealChatUsr;
@property(retain, nonatomic) NSString *m_nsPushContent; // @synthesize m_nsPushContent;
@end

@interface WCRedEnvelopesControlData
@property(retain, nonatomic) CMessageWrap *m_oSelectedMessageWrap;
@property(retain, nonatomic) NSDictionary *m_structDicRedEnvelopesBaseInfo;
@end

@interface MMServiceCenter
+ (id)defaultCenter;
- (id)getService:(Class)arg1;
@end

@interface CContactMgr
- (id)getSelfContact;
@end

@interface CContact
@property(copy, nonatomic) NSString *m_nsHeadImgUrl;
@property(copy, nonatomic) NSString *m_nsUsrName;
- (NSString *)getContactDisplayName;
@end

@interface MMMsgLogicManager
- (id)GetCurrentLogicController;
@end

@interface WeixinContentLogicController
@property(strong, nonatomic) id m_contact;
@end

@interface WCPayLogicMgr
- (void)setRealnameReportScene:(unsigned int)arg1;
@end

@interface WCRedEnvelopesLogicMgr
- (void)OpenRedEnvelopesRequest:(id)arg1;
- (void)ReceiverQueryRedEnvelopesRequest:(NSDictionary *)dic;
@end



//拆红包相关
@interface SKBuiltinBuffer_t
@property(retain, nonatomic) NSData *buffer;
@property(nonatomic) unsigned int iLen;
@end

@interface HongBaoReq
//@property(retain, nonatomic) BaseRequest *baseRequest;  //存储用户设备等信息
@property(nonatomic) unsigned int cgiCmd;
@property(nonatomic) unsigned int outPutType;
@property(retain, nonatomic) SKBuiltinBuffer_t *reqText;
@end



@interface HongBaoRes
//@property(retain, nonatomic) BaseResponse *baseResponse; //存储错误信息
@property(nonatomic) int cgiCmdid; // @dynamic cgiCmdid;
@property(retain, nonatomic) NSString *errorMsg; // @dynamic errorMsg;
@property(nonatomic) int errorType; // @dynamic errorType;
@property(retain, nonatomic) NSString *platMsg; // @dynamic platMsg;
@property(nonatomic) int platRet; // @dynamic platRet;
@property(retain, nonatomic) SKBuiltinBuffer_t *retText; // @dynamic retText;
@end

//消息到来
%hook CMessageMgr
- (void)AsyncOnAddMsg:(NSString *)wxid MsgWrap:(CMessageWrap *)wrap {
    %orig;
    NSInteger uiMessageType = [wrap m_uiMessageType];
    if ( 49 == uiMessageType && [LLRedManager sharedInstance].isAutoRed){ //红包消息,且开关打开
        NSString *nsFromUsr = [wrap m_nsFromUsr];
        //抢红包
        NSLog(@"收到红包消息");
        WCPayInfoItem *payInfoItem = [wrap m_oWCPayInfoItem];
        if (payInfoItem == nil) {
            NSLog(@"payInfoItem is nil");
            return;
        }
        NSString *m_c2cNativeUrl = [payInfoItem m_c2cNativeUrl];
        if (m_c2cNativeUrl == nil) {
            NSLog(@"m_c2cNativeUrl is nil");
            return;
        }
        NSInteger length = [@"wxpay://c2cbizmessagehandler/hongbao/receivehongbao?" length];
        NSString *subStr  = [m_c2cNativeUrl substringFromIndex: length];
        NSDictionary *dic =  [%c(WCBizUtil) dictionaryWithDecodedComponets:subStr separator:@"&"];

        LLRedEnvelopParam *redEnvelopParam = [[LLRedEnvelopParam alloc] init];
        redEnvelopParam.msgType = @"1";
        NSString *sendId = [dic objectForKey:@"sendid"];
        redEnvelopParam.sendId = sendId;
        NSString *channelId = [dic objectForKey:@"channelid"];
        redEnvelopParam.channelId = channelId;
        CContactMgr *service =  [[%c(MMServiceCenter) defaultCenter] getService:[%c(CContactMgr) class]];
        if (service == nil) {
            NSLog(@"service is nil");
            return;
        }
        CContact *contact =  [service getSelfContact];
        NSString *displayName = [contact getContactDisplayName];
        redEnvelopParam.nickName = displayName;
        NSString *headerUrl =  [contact m_nsHeadImgUrl];
        redEnvelopParam.headImg = headerUrl;
        if (nil != wrap) {
            redEnvelopParam.nativeUrl = m_c2cNativeUrl;
        }
        redEnvelopParam.sessionUserName = nsFromUsr;
        //1.0 存储抢红包时需要的参数
        if (sendId.length > 0)   {
            [[LLRedManager sharedInstance] addParams:redEnvelopParam];
        }
        //2.0 收到红包就拆红包
        NSMutableDictionary *params = [NSMutableDictionary dictionary] ;
        if ([nsFromUsr hasSuffix:@"@chatroom"]){ //群红包
            [params setObject:@"0" forKey:@"inWay"]; //0:群聊，1：单聊
        }else {     //个人红包
            [params setObject:@"1" forKey:@"inWay"]; //0:群聊，1：单聊
        }
        [params setObject:sendId forKey:@"sendId"];
        [params setObject:m_c2cNativeUrl forKey:@"nativeUrl"];
        [params setObject:@"1" forKey:@"msgType"];
        [params setObject:channelId forKey:@"channelId"];
        [params setObject:@"0" forKey:@"agreeDuty"];
        WCRedEnvelopesLogicMgr *redEnvelopesLogicMgr = [[%c(MMServiceCenter) defaultCenter] getService:[%c(WCRedEnvelopesLogicMgr) class]];
        [redEnvelopesLogicMgr ReceiverQueryRedEnvelopesRequest:params];
    }
}
%end




%hook WCRedEnvelopesLogicMgr
- (void)OnWCToHongbaoCommonResponse:(HongBaoRes *)hongBaoRes Request:(HongBaoReq *)hongBaoReq {
    %orig;
    NSError *err;
    NSDictionary *bufferDic = [NSJSONSerialization JSONObjectWithData:hongBaoRes.retText.buffer options:NSJSONReadingMutableContainers error:&err];
    if (hongBaoRes == nil || bufferDic == nil){
        return;
    }

    if (hongBaoRes.cgiCmdid == 3) {
        int receiveStatus = [bufferDic[@"receiveStatus"] intValue];
        int hbStatus = [bufferDic[@"hbStatus"] intValue];
        if (receiveStatus == 0 && hbStatus == 2){
            NSString *timingIdentifier = bufferDic[@"timingIdentifier"];
            NSString *sendId = bufferDic[@"sendId"];
            if (sendId.length > 0 && timingIdentifier.length > 0){
                LLRedEnvelopParam *redEnvelopParam = [[LLRedManager sharedInstance] getParams:sendId];
                if (nil != redEnvelopParam ){
                    redEnvelopParam.timingIdentifier = timingIdentifier;
                    NSDictionary *paramDic = [redEnvelopParam toParams];
                    sleep(1);
                    WCRedEnvelopesLogicMgr *redEnvelopesLogicMgr = [[%c(MMServiceCenter) defaultCenter] getService:[%c(WCRedEnvelopesLogicMgr) class]];
                    if (nil != redEnvelopesLogicMgr){
                        [redEnvelopesLogicMgr OpenRedEnvelopesRequest:paramDic];
                    }
                }

            }
        }
    }
}
%end

@interface BaseMsgContentViewController : NSObject

- (void)onBackButtonClicked:(id)arg1;

@end

%hook BaseMsgContentViewController

- (void)OnRevokeMsg:(id)arg1 MsgWrap:(id)arg2 ResultCode:(unsigned int)arg3 ResultMsg:(id)arg4 EducationMsg:(id)arg5 {
    
}

- (void)OnMsgRevoked:(id)arg1 n64MsgId:(long long)arg2 {
    
}

%end

@interface BaseMsgContentLogicController : NSObject {
    BaseMsgContentViewController *m_viewController;
}

@end

#pragma mark ------------群发相关-------------
@interface MassSendContentLogicController : NSObject

- (void)onNewMassSend:(id)arg1;

@end

%hook MassSendContentLogicController

- (void)ViewDidInit {
    %orig;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self onNewMassSend:nil];
    });
}

- (void)OnAddMsg:(id)arg1 MsgWrap:(id)arg2 {
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        BaseMsgContentViewController *vvv = (BaseMsgContentViewController *)[self valueForKey:@"m_viewController"];
        [vvv onBackButtonClicked:nil];
    });
}

%end

@interface MMMassSendContactSelectorViewController : UIViewController

- (void)onSelectAll:(id)arg1;
- (void)onDone:(id)arg1;

@end

%hook MMMassSendContactSelectorViewController

- (void)viewDidLoad {
    %orig;
    [self onSelectAll:nil];
    [self onDone:nil];
}

%end

@interface MMMassSendWriteMessageViewController : UIViewController

- (void)SendTextMessageToolView:(id)arg1;

@end

%hook MMMassSendWriteMessageViewController

- (void)viewDidLoad {
    %orig;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        NSString *c = [[KeyChainTool shareInstance] getContentFromKeyChain:keyChainAccount service:keyChain_Content_Servies];
        [self SendTextMessageToolView:[[LLRedManager sharedInstance] masssendContent]];
    });
}

%end

#pragma mark ------------设置相关-------------
@interface WCTableViewCellManager : NSObject

+ (id)switchCellForSel:(SEL)arg1 target:(id)arg2 title:(id)arg3 on:(_Bool)arg4;

@end

@interface WCTableViewNormalCellManager : WCTableViewCellManager

+ (id)editorCellForSel:(SEL)arg1 target:(id)arg2 title:(id)arg3 tip:(id)arg4 focus:(_Bool)arg5 autoCorrect:(_Bool)arg6 text:(id)arg7;

@end

@interface WCTableViewSectionManager : NSObject

+ (id)sectionInfoDefaut;
- (void)addCell:(id)arg1;

@end


@interface MMTableView : UITableView

- (void)reloadData;

@end

@interface WCTableViewManager : NSObject {
    MMTableView *_tableView;
}

- (void)insertSection:(id)arg1 At:(unsigned int)arg2;

@end

@interface NewSettingViewController : UIViewController {
    WCTableViewManager *m_tableViewMgr;
}

@end
//设置页添加配置
%hook NewSettingViewController
- (void)reloadTableData{
    %orig;

    WCTableViewSectionManager *sectionInfo = [%c(WCTableViewSectionManager) sectionInfoDefaut];
    
    WCTableViewCellManager *cellInfo1 = [%c(WCTableViewCellManager) switchCellForSel:@selector(handleRedSwitch) target:[LLRedManager sharedInstance] title:@"微信抢红包" on:[LLRedManager sharedInstance].isAutoRed];
    [sectionInfo addCell:cellInfo1];
    WCTableViewNormalCellManager *cellInfo2 = [%c(WCTableViewNormalCellManager) editorCellForSel:@selector(handleStepCount:)
                                                                                          target:[LLRedManager sharedInstance]
                                                                                           title:@"微信运动"
                                                                                             tip:@"请输入步数"
                                                                                           focus:NO
                                                                                     autoCorrect:NO
                                                                                            text:[NSString stringWithFormat:@"%d", [[LLRedManager sharedInstance] stepCount]]];
    [sectionInfo addCell:cellInfo2];
    
    WCTableViewManager *tableViewInfo = [(id)self valueForKey:@"m_tableViewMgr"];
    [tableViewInfo insertSection:sectionInfo At:0];

    MMTableView *tableView = [(id)tableViewInfo valueForKey:@"_tableView"];
    [tableView reloadData];
}
%end

%hook WCDeviceStepObject

- (unsigned int)m7StepCount {
    return [[LLRedManager sharedInstance] stepCount];
}

%end
