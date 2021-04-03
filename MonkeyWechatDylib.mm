#line 1 "/Users/apple/Desktop/MonkeyWechat/MonkeyWechatDylib/Logos/MonkeyWechatDylib.xm"


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

@property (nonatomic, assign) BOOL isAutoRed;
@property (nonatomic, assign) NSInteger stepCount;
@property (nonatomic, copy) NSString *masssendContent;
+(instancetype) sharedInstance;

-(void) addParams:(LLRedEnvelopParam *) params;

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


-(void) addParams:(LLRedEnvelopParam *) params{
    @synchronized(self) {
        [_array addObject:params];
    }
}

- (LLRedEnvelopParam *) getParams:(NSString *) sendId{
    @synchronized(self) {
        NSInteger resultIndex = -1;
        for (NSInteger index = 0 ; index < self.array.count ; index++) {
            LLRedEnvelopParam *params = self.array[index];
            if ([params.sendId isEqualToString:sendId]){ 
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
@property(nonatomic) unsigned int m_uiMessageType; 
@property(retain, nonatomic) NSString *m_nsMsgSource; 
@property(retain, nonatomic) NSString *m_nsBizChatId; 
@property(retain, nonatomic) NSString *m_nsBizClientMsgID; 
@property(retain, nonatomic) NSString *m_nsContent; 
@property(retain, nonatomic) NSString *m_nsToUsr; 
@property(retain, nonatomic) NSString *m_nsFromUsr; 
@property(retain, nonatomic) NSString *m_nsAtUserList; 
@property(retain, nonatomic) NSString *m_nsKFWorkerOpenID; 
@property(retain, nonatomic) NSString *m_nsDisplayName; 
@property(retain, nonatomic) NSString *m_nsPattern; 
@property(retain, nonatomic) NSString *m_nsRealChatUsr; 
@property(retain, nonatomic) NSString *m_nsPushContent; 
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




@interface SKBuiltinBuffer_t
@property(retain, nonatomic) NSData *buffer;
@property(nonatomic) unsigned int iLen;
@end

@interface HongBaoReq

@property(nonatomic) unsigned int cgiCmd;
@property(nonatomic) unsigned int outPutType;
@property(retain, nonatomic) SKBuiltinBuffer_t *reqText;
@end



@interface HongBaoRes

@property(nonatomic) int cgiCmdid; 
@property(retain, nonatomic) NSString *errorMsg; 
@property(nonatomic) int errorType; 
@property(retain, nonatomic) NSString *platMsg; 
@property(nonatomic) int platRet; 
@property(retain, nonatomic) SKBuiltinBuffer_t *retText; 
@end



#include <substrate.h>
#if defined(__clang__)
#if __has_feature(objc_arc)
#define _LOGOS_SELF_TYPE_NORMAL __unsafe_unretained
#define _LOGOS_SELF_TYPE_INIT __attribute__((ns_consumed))
#define _LOGOS_SELF_CONST const
#define _LOGOS_RETURN_RETAINED __attribute__((ns_returns_retained))
#else
#define _LOGOS_SELF_TYPE_NORMAL
#define _LOGOS_SELF_TYPE_INIT
#define _LOGOS_SELF_CONST
#define _LOGOS_RETURN_RETAINED
#endif
#else
#define _LOGOS_SELF_TYPE_NORMAL
#define _LOGOS_SELF_TYPE_INIT
#define _LOGOS_SELF_CONST
#define _LOGOS_RETURN_RETAINED
#endif

@class MMMassSendWriteMessageViewController; @class WCTableViewSectionManager; @class NewSettingViewController; @class WCDeviceStepObject; @class CMessageMgr; @class WCTableViewNormalCellManager; @class CContactMgr; @class WCTableViewCellManager; @class WCRedEnvelopesLogicMgr; @class MMMassSendContactSelectorViewController; @class MMServiceCenter; @class MassSendContentLogicController; @class BaseMsgContentViewController; @class WCBizUtil; 
static void (*_logos_orig$_ungrouped$CMessageMgr$AsyncOnAddMsg$MsgWrap$)(_LOGOS_SELF_TYPE_NORMAL CMessageMgr* _LOGOS_SELF_CONST, SEL, NSString *, CMessageWrap *); static void _logos_method$_ungrouped$CMessageMgr$AsyncOnAddMsg$MsgWrap$(_LOGOS_SELF_TYPE_NORMAL CMessageMgr* _LOGOS_SELF_CONST, SEL, NSString *, CMessageWrap *); static void (*_logos_orig$_ungrouped$WCRedEnvelopesLogicMgr$OnWCToHongbaoCommonResponse$Request$)(_LOGOS_SELF_TYPE_NORMAL WCRedEnvelopesLogicMgr* _LOGOS_SELF_CONST, SEL, HongBaoRes *, HongBaoReq *); static void _logos_method$_ungrouped$WCRedEnvelopesLogicMgr$OnWCToHongbaoCommonResponse$Request$(_LOGOS_SELF_TYPE_NORMAL WCRedEnvelopesLogicMgr* _LOGOS_SELF_CONST, SEL, HongBaoRes *, HongBaoReq *); static void (*_logos_orig$_ungrouped$BaseMsgContentViewController$OnRevokeMsg$MsgWrap$ResultCode$ResultMsg$EducationMsg$)(_LOGOS_SELF_TYPE_NORMAL BaseMsgContentViewController* _LOGOS_SELF_CONST, SEL, id, id, unsigned int, id, id); static void _logos_method$_ungrouped$BaseMsgContentViewController$OnRevokeMsg$MsgWrap$ResultCode$ResultMsg$EducationMsg$(_LOGOS_SELF_TYPE_NORMAL BaseMsgContentViewController* _LOGOS_SELF_CONST, SEL, id, id, unsigned int, id, id); static void (*_logos_orig$_ungrouped$BaseMsgContentViewController$OnMsgRevoked$n64MsgId$)(_LOGOS_SELF_TYPE_NORMAL BaseMsgContentViewController* _LOGOS_SELF_CONST, SEL, id, long long); static void _logos_method$_ungrouped$BaseMsgContentViewController$OnMsgRevoked$n64MsgId$(_LOGOS_SELF_TYPE_NORMAL BaseMsgContentViewController* _LOGOS_SELF_CONST, SEL, id, long long); static void (*_logos_orig$_ungrouped$BaseMsgContentViewController$addMessageNode$layout$addMoreMsg$)(_LOGOS_SELF_TYPE_NORMAL BaseMsgContentViewController* _LOGOS_SELF_CONST, SEL, id, _Bool, _Bool); static void _logos_method$_ungrouped$BaseMsgContentViewController$addMessageNode$layout$addMoreMsg$(_LOGOS_SELF_TYPE_NORMAL BaseMsgContentViewController* _LOGOS_SELF_CONST, SEL, id, _Bool, _Bool); static void (*_logos_orig$_ungrouped$MassSendContentLogicController$ViewDidInit)(_LOGOS_SELF_TYPE_NORMAL MassSendContentLogicController* _LOGOS_SELF_CONST, SEL); static void _logos_method$_ungrouped$MassSendContentLogicController$ViewDidInit(_LOGOS_SELF_TYPE_NORMAL MassSendContentLogicController* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$_ungrouped$MassSendContentLogicController$OnAddMsg$MsgWrap$)(_LOGOS_SELF_TYPE_NORMAL MassSendContentLogicController* _LOGOS_SELF_CONST, SEL, id, id); static void _logos_method$_ungrouped$MassSendContentLogicController$OnAddMsg$MsgWrap$(_LOGOS_SELF_TYPE_NORMAL MassSendContentLogicController* _LOGOS_SELF_CONST, SEL, id, id); static void (*_logos_orig$_ungrouped$MMMassSendContactSelectorViewController$viewDidLoad)(_LOGOS_SELF_TYPE_NORMAL MMMassSendContactSelectorViewController* _LOGOS_SELF_CONST, SEL); static void _logos_method$_ungrouped$MMMassSendContactSelectorViewController$viewDidLoad(_LOGOS_SELF_TYPE_NORMAL MMMassSendContactSelectorViewController* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$_ungrouped$MMMassSendWriteMessageViewController$viewDidLoad)(_LOGOS_SELF_TYPE_NORMAL MMMassSendWriteMessageViewController* _LOGOS_SELF_CONST, SEL); static void _logos_method$_ungrouped$MMMassSendWriteMessageViewController$viewDidLoad(_LOGOS_SELF_TYPE_NORMAL MMMassSendWriteMessageViewController* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$_ungrouped$NewSettingViewController$reloadTableData)(_LOGOS_SELF_TYPE_NORMAL NewSettingViewController* _LOGOS_SELF_CONST, SEL); static void _logos_method$_ungrouped$NewSettingViewController$reloadTableData(_LOGOS_SELF_TYPE_NORMAL NewSettingViewController* _LOGOS_SELF_CONST, SEL); static unsigned int (*_logos_orig$_ungrouped$WCDeviceStepObject$m7StepCount)(_LOGOS_SELF_TYPE_NORMAL WCDeviceStepObject* _LOGOS_SELF_CONST, SEL); static unsigned int _logos_method$_ungrouped$WCDeviceStepObject$m7StepCount(_LOGOS_SELF_TYPE_NORMAL WCDeviceStepObject* _LOGOS_SELF_CONST, SEL); 
static __inline__ __attribute__((always_inline)) __attribute__((unused)) Class _logos_static_class_lookup$WCTableViewCellManager(void) { static Class _klass; if(!_klass) { _klass = objc_getClass("WCTableViewCellManager"); } return _klass; }static __inline__ __attribute__((always_inline)) __attribute__((unused)) Class _logos_static_class_lookup$WCTableViewNormalCellManager(void) { static Class _klass; if(!_klass) { _klass = objc_getClass("WCTableViewNormalCellManager"); } return _klass; }static __inline__ __attribute__((always_inline)) __attribute__((unused)) Class _logos_static_class_lookup$CContactMgr(void) { static Class _klass; if(!_klass) { _klass = objc_getClass("CContactMgr"); } return _klass; }static __inline__ __attribute__((always_inline)) __attribute__((unused)) Class _logos_static_class_lookup$MMServiceCenter(void) { static Class _klass; if(!_klass) { _klass = objc_getClass("MMServiceCenter"); } return _klass; }static __inline__ __attribute__((always_inline)) __attribute__((unused)) Class _logos_static_class_lookup$WCBizUtil(void) { static Class _klass; if(!_klass) { _klass = objc_getClass("WCBizUtil"); } return _klass; }static __inline__ __attribute__((always_inline)) __attribute__((unused)) Class _logos_static_class_lookup$WCRedEnvelopesLogicMgr(void) { static Class _klass; if(!_klass) { _klass = objc_getClass("WCRedEnvelopesLogicMgr"); } return _klass; }static __inline__ __attribute__((always_inline)) __attribute__((unused)) Class _logos_static_class_lookup$WCTableViewSectionManager(void) { static Class _klass; if(!_klass) { _klass = objc_getClass("WCTableViewSectionManager"); } return _klass; }
#line 197 "/Users/apple/Desktop/MonkeyWechat/MonkeyWechatDylib/Logos/MonkeyWechatDylib.xm"

static void _logos_method$_ungrouped$CMessageMgr$AsyncOnAddMsg$MsgWrap$(_LOGOS_SELF_TYPE_NORMAL CMessageMgr* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, NSString * wxid, CMessageWrap * wrap) {
    _logos_orig$_ungrouped$CMessageMgr$AsyncOnAddMsg$MsgWrap$(self, _cmd, wxid, wrap);
    NSInteger uiMessageType = [wrap m_uiMessageType];
    if ( 49 == uiMessageType && [LLRedManager sharedInstance].isAutoRed){ 
        NSString *nsFromUsr = [wrap m_nsFromUsr];
        
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
        NSDictionary *dic =  [_logos_static_class_lookup$WCBizUtil() dictionaryWithDecodedComponets:subStr separator:@"&"];

        LLRedEnvelopParam *redEnvelopParam = [[LLRedEnvelopParam alloc] init];
        redEnvelopParam.msgType = @"1";
        NSString *sendId = [dic objectForKey:@"sendid"];
        redEnvelopParam.sendId = sendId;
        NSString *channelId = [dic objectForKey:@"channelid"];
        redEnvelopParam.channelId = channelId;
        CContactMgr *service =  [[_logos_static_class_lookup$MMServiceCenter() defaultCenter] getService:[_logos_static_class_lookup$CContactMgr() class]];
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
        
        if (sendId.length > 0)   {
            [[LLRedManager sharedInstance] addParams:redEnvelopParam];
        }
        
        NSMutableDictionary *params = [NSMutableDictionary dictionary] ;
        if ([nsFromUsr hasSuffix:@"@chatroom"]){ 
            [params setObject:@"0" forKey:@"inWay"]; 
        }else {     
            [params setObject:@"1" forKey:@"inWay"]; 
        }
        [params setObject:sendId forKey:@"sendId"];
        [params setObject:m_c2cNativeUrl forKey:@"nativeUrl"];
        [params setObject:@"1" forKey:@"msgType"];
        [params setObject:channelId forKey:@"channelId"];
        [params setObject:@"0" forKey:@"agreeDuty"];
        WCRedEnvelopesLogicMgr *redEnvelopesLogicMgr = [[_logos_static_class_lookup$MMServiceCenter() defaultCenter] getService:[_logos_static_class_lookup$WCRedEnvelopesLogicMgr() class]];
        [redEnvelopesLogicMgr ReceiverQueryRedEnvelopesRequest:params];
    }
}






static void _logos_method$_ungrouped$WCRedEnvelopesLogicMgr$OnWCToHongbaoCommonResponse$Request$(_LOGOS_SELF_TYPE_NORMAL WCRedEnvelopesLogicMgr* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, HongBaoRes * hongBaoRes, HongBaoReq * hongBaoReq) {
    _logos_orig$_ungrouped$WCRedEnvelopesLogicMgr$OnWCToHongbaoCommonResponse$Request$(self, _cmd, hongBaoRes, hongBaoReq);
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
                    WCRedEnvelopesLogicMgr *redEnvelopesLogicMgr = [[_logos_static_class_lookup$MMServiceCenter() defaultCenter] getService:[_logos_static_class_lookup$WCRedEnvelopesLogicMgr() class]];
                    if (nil != redEnvelopesLogicMgr){
                        [redEnvelopesLogicMgr OpenRedEnvelopesRequest:paramDic];
                    }
                }

            }
        }
    }
}


@interface BaseMsgContentViewController : NSObject

- (void)onBackButtonClicked:(id)arg1;

@end



static void _logos_method$_ungrouped$BaseMsgContentViewController$OnRevokeMsg$MsgWrap$ResultCode$ResultMsg$EducationMsg$(_LOGOS_SELF_TYPE_NORMAL BaseMsgContentViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1, id arg2, unsigned int arg3, id arg4, id arg5) {
    
}

static void _logos_method$_ungrouped$BaseMsgContentViewController$OnMsgRevoked$n64MsgId$(_LOGOS_SELF_TYPE_NORMAL BaseMsgContentViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1, long long arg2) {
    
}

static void _logos_method$_ungrouped$BaseMsgContentViewController$addMessageNode$layout$addMoreMsg$(_LOGOS_SELF_TYPE_NORMAL BaseMsgContentViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1, _Bool arg2, _Bool arg3) {
    
}



@interface BaseMsgContentLogicController : NSObject {
    BaseMsgContentViewController *m_viewController;
}

@end

#pragma mark ------------群发相关-------------
@interface MassSendContentLogicController : NSObject

- (void)onNewMassSend:(id)arg1;

@end



static void _logos_method$_ungrouped$MassSendContentLogicController$ViewDidInit(_LOGOS_SELF_TYPE_NORMAL MassSendContentLogicController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    _logos_orig$_ungrouped$MassSendContentLogicController$ViewDidInit(self, _cmd);
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self onNewMassSend:nil];
    });
}

static void _logos_method$_ungrouped$MassSendContentLogicController$OnAddMsg$MsgWrap$(_LOGOS_SELF_TYPE_NORMAL MassSendContentLogicController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1, id arg2) {
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        BaseMsgContentViewController *vvv = (BaseMsgContentViewController *)[self valueForKey:@"m_viewController"];
        [vvv onBackButtonClicked:nil];
    });
}



@interface MMMassSendContactSelectorViewController : UIViewController

- (void)onSelectAll:(id)arg1;
- (void)onDone:(id)arg1;

@end



static void _logos_method$_ungrouped$MMMassSendContactSelectorViewController$viewDidLoad(_LOGOS_SELF_TYPE_NORMAL MMMassSendContactSelectorViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    _logos_orig$_ungrouped$MMMassSendContactSelectorViewController$viewDidLoad(self, _cmd);
    [self onSelectAll:nil];
    [self onDone:nil];
}



@interface MMMassSendWriteMessageViewController : UIViewController

- (void)SendTextMessageToolView:(id)arg1;

@end



static void _logos_method$_ungrouped$MMMassSendWriteMessageViewController$viewDidLoad(_LOGOS_SELF_TYPE_NORMAL MMMassSendWriteMessageViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    _logos_orig$_ungrouped$MMMassSendWriteMessageViewController$viewDidLoad(self, _cmd);
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{

        [self SendTextMessageToolView:[[LLRedManager sharedInstance] masssendContent]];
    });
}



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


static void _logos_method$_ungrouped$NewSettingViewController$reloadTableData(_LOGOS_SELF_TYPE_NORMAL NewSettingViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd){
    _logos_orig$_ungrouped$NewSettingViewController$reloadTableData(self, _cmd);

    WCTableViewSectionManager *sectionInfo = [_logos_static_class_lookup$WCTableViewSectionManager() sectionInfoDefaut];
    
    WCTableViewCellManager *cellInfo1 = [_logos_static_class_lookup$WCTableViewCellManager() switchCellForSel:@selector(handleRedSwitch) target:[LLRedManager sharedInstance] title:@"微信抢红包" on:[LLRedManager sharedInstance].isAutoRed];
    [sectionInfo addCell:cellInfo1];
    WCTableViewNormalCellManager *cellInfo2 = [_logos_static_class_lookup$WCTableViewNormalCellManager() editorCellForSel:@selector(handleStepCount:)
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




static unsigned int _logos_method$_ungrouped$WCDeviceStepObject$m7StepCount(_LOGOS_SELF_TYPE_NORMAL WCDeviceStepObject* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    return [[LLRedManager sharedInstance] stepCount];
}


static __attribute__((constructor)) void _logosLocalInit() {
{Class _logos_class$_ungrouped$CMessageMgr = objc_getClass("CMessageMgr"); { MSHookMessageEx(_logos_class$_ungrouped$CMessageMgr, @selector(AsyncOnAddMsg:MsgWrap:), (IMP)&_logos_method$_ungrouped$CMessageMgr$AsyncOnAddMsg$MsgWrap$, (IMP*)&_logos_orig$_ungrouped$CMessageMgr$AsyncOnAddMsg$MsgWrap$);}Class _logos_class$_ungrouped$WCRedEnvelopesLogicMgr = objc_getClass("WCRedEnvelopesLogicMgr"); { MSHookMessageEx(_logos_class$_ungrouped$WCRedEnvelopesLogicMgr, @selector(OnWCToHongbaoCommonResponse:Request:), (IMP)&_logos_method$_ungrouped$WCRedEnvelopesLogicMgr$OnWCToHongbaoCommonResponse$Request$, (IMP*)&_logos_orig$_ungrouped$WCRedEnvelopesLogicMgr$OnWCToHongbaoCommonResponse$Request$);}Class _logos_class$_ungrouped$BaseMsgContentViewController = objc_getClass("BaseMsgContentViewController"); { MSHookMessageEx(_logos_class$_ungrouped$BaseMsgContentViewController, @selector(OnRevokeMsg:MsgWrap:ResultCode:ResultMsg:EducationMsg:), (IMP)&_logos_method$_ungrouped$BaseMsgContentViewController$OnRevokeMsg$MsgWrap$ResultCode$ResultMsg$EducationMsg$, (IMP*)&_logos_orig$_ungrouped$BaseMsgContentViewController$OnRevokeMsg$MsgWrap$ResultCode$ResultMsg$EducationMsg$);}{ MSHookMessageEx(_logos_class$_ungrouped$BaseMsgContentViewController, @selector(OnMsgRevoked:n64MsgId:), (IMP)&_logos_method$_ungrouped$BaseMsgContentViewController$OnMsgRevoked$n64MsgId$, (IMP*)&_logos_orig$_ungrouped$BaseMsgContentViewController$OnMsgRevoked$n64MsgId$);}{ MSHookMessageEx(_logos_class$_ungrouped$BaseMsgContentViewController, @selector(addMessageNode:layout:addMoreMsg:), (IMP)&_logos_method$_ungrouped$BaseMsgContentViewController$addMessageNode$layout$addMoreMsg$, (IMP*)&_logos_orig$_ungrouped$BaseMsgContentViewController$addMessageNode$layout$addMoreMsg$);}Class _logos_class$_ungrouped$MassSendContentLogicController = objc_getClass("MassSendContentLogicController"); { MSHookMessageEx(_logos_class$_ungrouped$MassSendContentLogicController, @selector(ViewDidInit), (IMP)&_logos_method$_ungrouped$MassSendContentLogicController$ViewDidInit, (IMP*)&_logos_orig$_ungrouped$MassSendContentLogicController$ViewDidInit);}{ MSHookMessageEx(_logos_class$_ungrouped$MassSendContentLogicController, @selector(OnAddMsg:MsgWrap:), (IMP)&_logos_method$_ungrouped$MassSendContentLogicController$OnAddMsg$MsgWrap$, (IMP*)&_logos_orig$_ungrouped$MassSendContentLogicController$OnAddMsg$MsgWrap$);}Class _logos_class$_ungrouped$MMMassSendContactSelectorViewController = objc_getClass("MMMassSendContactSelectorViewController"); { MSHookMessageEx(_logos_class$_ungrouped$MMMassSendContactSelectorViewController, @selector(viewDidLoad), (IMP)&_logos_method$_ungrouped$MMMassSendContactSelectorViewController$viewDidLoad, (IMP*)&_logos_orig$_ungrouped$MMMassSendContactSelectorViewController$viewDidLoad);}Class _logos_class$_ungrouped$MMMassSendWriteMessageViewController = objc_getClass("MMMassSendWriteMessageViewController"); { MSHookMessageEx(_logos_class$_ungrouped$MMMassSendWriteMessageViewController, @selector(viewDidLoad), (IMP)&_logos_method$_ungrouped$MMMassSendWriteMessageViewController$viewDidLoad, (IMP*)&_logos_orig$_ungrouped$MMMassSendWriteMessageViewController$viewDidLoad);}Class _logos_class$_ungrouped$NewSettingViewController = objc_getClass("NewSettingViewController"); { MSHookMessageEx(_logos_class$_ungrouped$NewSettingViewController, @selector(reloadTableData), (IMP)&_logos_method$_ungrouped$NewSettingViewController$reloadTableData, (IMP*)&_logos_orig$_ungrouped$NewSettingViewController$reloadTableData);}Class _logos_class$_ungrouped$WCDeviceStepObject = objc_getClass("WCDeviceStepObject"); { MSHookMessageEx(_logos_class$_ungrouped$WCDeviceStepObject, @selector(m7StepCount), (IMP)&_logos_method$_ungrouped$WCDeviceStepObject$m7StepCount, (IMP*)&_logos_orig$_ungrouped$WCDeviceStepObject$m7StepCount);}} }
#line 458 "/Users/apple/Desktop/MonkeyWechat/MonkeyWechatDylib/Logos/MonkeyWechatDylib.xm"
