//
//  ViewController.m
//  AFNDemo
//
//  Created by 谢果冻 on 2017/6/10.
//  Copyright © 2017年 谢果冻. All rights reserved.
//

#import "ViewController.h"
#import "ViewController2.h"
@interface ViewController ()<UIImagePickerControllerDelegate, UINavigationControllerDelegate>
//@property (nonatomic, strong) IQKeyboardReturnKeyHandler *returnHandle;

@property (nonatomic, strong) NSData *imageData;

@end

@implementation ViewController

//- (void)viewWillAppear:(BOOL)animated {
//    [super viewWillAppear:animated];
//    [IQKeyboardManager sharedManager].enable = NO;
//}
//
//- (void)viewWillDisappear:(BOOL)animated {
//    [super viewWillDisappear:animated];
//    [IQKeyboardManager sharedManager].enable = YES;
//}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
//    [self FMDB];
//    [self uploadImageToAliyun];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self architecture];
    });
}

- (void)uploadImageToAliyun {
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    button.frame = CGRectMake(0, 0, 50, 30);
    button.center = self.view.center;
    [self.view addSubview:button];
    button.backgroundColor = [UIColor redColor];
    [button addTarget:self action:@selector(buttonClicked) forControlEvents:UIControlEventTouchUpInside];
}

- (void)FMDB {
    //1.沙盒目录
    NSString *sanboxPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    NSString *dbPath = [sanboxPath stringByAppendingPathComponent:@"student.sqlite"];
    FMDatabase *db = [FMDatabase databaseWithPath:dbPath];
    
    if ([db open]) {
        BOOL result = [db executeUpdate:@"CREATE TABLE IF NOT EXISTS t_student (id integer PRIMARY KEY AUTOINCREMENT, name text NOT NULL, age integer NOT NULL);"];
        if (result) {
            NSLog(@"create table success!");
        } else {
            NSLog(@"create table faild!");
        }
    }
    //insert
//    BOOL insert =  [db executeUpdate:@"INSERT INTO t_student (id, name, age) VALUES (?, ?, ?);",@9527, @"大话数据库", @22];
//    BOOL insert = [db executeUpdateWithFormat:@"insert into t_student (id, name, age) values (%i, %@, %i);", 9526, @"月光宝盒", 23];
    BOOL insert = [db executeQuery:@"INSERT INTO t_student (id, name, age) VALUES (?, ?, ?);" withArgumentsInArray:@[@23, @"小明", @2]];
    if (insert) {
        NSLog(@"insert success!");
    }
    
//    BOOL delete = [db executeUpdate:@"delete from t_student where id = ?;",@23];
    BOOL delete = [db executeUpdateWithFormat:@"delete from t_student where name = %@;", @"月光宝盒"];
    

    if (delete) {
        NSLog(@"delete success!");
    }
    BOOL update = [db executeUpdate:@"update t_student set name = ? where name = ?;", @"数据库",@"大话数据库"];
    if (update) {
        NSLog(@"update success!");
    }

    //1.创建队列
    FMDatabaseQueue *queue = [FMDatabaseQueue databaseQueueWithPath:dbPath];
    __block BOOL whoopsSomethingWrongHappened = true;
    
    //2.把任务包装到事务里
    [queue inTransaction:^(FMDatabase *db, BOOL *rollback) {
        
        whoopsSomethingWrongHappened &=  [db executeUpdate:@"INSERT INTO t_student VALUES (?, ?, ?);", @2, @"123", @23];
        whoopsSomethingWrongHappened &= [db executeUpdate:@"INSERT INTO t_student VALUES (?, ?, ?);" ,@5, @"456", @56];
        
        whoopsSomethingWrongHappened &= [db executeUpdate:@"INSERT INTO t_student VALUES (?, ?, ?);", @8, @"789", @"89"];
        //如果有错误 返回
        if (!whoopsSomethingWrongHappened)
        {
            *rollback = YES;
            return;
        }
    }];
    
    //查询整个表
    FMResultSet *resultSet = [db executeQuery:@"select * from t_student;"];
    
    //根据条件查询
//    FMResultSet *resultSet = [db executeQuery:@"select * from t_student where id<?;", @(14)];
    
    //遍历结果集合
    
    while ([resultSet  next]) {
        int idNum = [resultSet intForColumn:@"id"];
        
        NSString *name = [resultSet objectForColumnName:@"name"];
        
        int age = [resultSet intForColumn:@"age"];
        
        NSLog(@"idNum = %d, name = %@, age = %d", idNum, name, age);
    }
    
//    BOOL drop = [db executeUpdate:@"drop table if exists t_student;"];
//    if (drop) {
//        NSLog(@"drop success!");
//    }
    
}

- (void)demo {
    
//    self.returnHandle = [[IQKeyboardReturnKeyHandler alloc] initWithViewController:self];
//    
//    _returnHandle.lastTextFieldReturnKeyType = UIReturnKeySearch;
    
    [[XGDDataHandle sharedXGDDataHandle] checkIfTheNetWorkIsConnectedWithReturnValueBlock:^(AFNetworkReachabilityStatus status) {
        //        NSLog(@"status = %ld", (long)status);
    }];
    //    [self performSelector:@selector(check) withObject:nil afterDelay:0.35f];
    
    
    [MGJRouter registerURLPattern:@"mgj://cart/orderCount" toObjectHandler:^id(NSDictionary *routerParameters) {
        return @22;
    }];
    
    [MGJRouter registerURLPattern:@"mgj://foo/bar//传值" toHandler:^(NSDictionary *routerParameters) {
        //        NSLog(@"MGJRouterParameterURL = %@", routerParameters[MGJRouterParameterURL]);
    }];
    
    [MGJRouter registerURLPattern:@"mgj://search/:query" toHandler:^(NSDictionary *routerParameters) {
        //        NSLog(@"color = %@, query = %@", routerParameters[@"color"], routerParameters[@"query"]);
    }];
    
    [MGJRouter registerURLPattern:@"mgj://category/travel" toHandler:^(NSDictionary *routerParameters) {
        //        NSLog(@"MGJRouterParameterUserInfo`s user_id = %@", routerParameters[MGJRouterParameterUserInfo][@"user_id"]);
        //        NSLog(@"MGJRouterParameterCompletion = %@", routerParameters[MGJRouterParameterCompletion]);
    }];
    
    [MGJRouter registerURLPattern:@"mgj://" toHandler:^(NSDictionary *routerParameters) {
        NSLog(@"routerParameters = %@", routerParameters);
    }];
    
    [MGJRouter registerURLPattern:@"mgj://foo/bar/none/exists" toHandler:^(NSDictionary *routerParameters) {
        NSLog(@"routerParameters = %@", routerParameters);
    }];
    
    [MGJRouter registerURLPattern:@"mgj://detail" toHandler:^(NSDictionary *routerParameters) {
        NSLog(@"routerParameters = %@", routerParameters);
        //        __block NSDictionary *blockRouterParameters = blockRouterParameters;
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.25 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            
            void (^completion)(id result) = routerParameters[MGJRouterParameterCompletion];
            if (completion) {
                completion(@"result");
            }
            //        NSLog(@"%@", result);
        });
        
    }];
    
    [MGJRouter registerURLPattern:@"mgj://search/:keyword" toHandler:^(NSDictionary *routerParameters) {
        NSLog(@"routerParameters`s keyword = %@", routerParameters[@"keyword"]);
    }];
    
    [MGJRouter deregisterURLPattern:@"mgj://search/:keyword"];
    
    [MGJRouter registerURLPattern:@"mgj://search_top_bar" toObjectHandler:^id(NSDictionary *routerParameters) {
        return [[UIView alloc] init];
    }];
}

- (void)check {
    if(![[XGDDataHandle sharedXGDDataHandle] checkNetWorkStatus]){
        NSLog(@"adgsa");
    } else {
        NSLog(@"112");
    }
    
}

- (void)buttonClicked {
    ViewController2 *VC2 = [[ViewController2 alloc] init];


    [self presentViewController:VC2 animated:YES completion:^{
//        NSLog(@"vc2");
    }];
    return;
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    picker.allowsEditing = YES;
    [self presentViewController:picker animated:YES completion:nil];
    
}

- (UIImage *)imageWithSourceImage:(UIImage *)sourceImage scaledToSize:(CGSize )newSize {
    UIGraphicsBeginImageContext(newSize);
    [sourceImage drawInRect:CGRectMake(0, 0, newSize.width, newSize.height)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info {
    UIImage *avatar = info[UIImagePickerControllerOriginalImage];
    [picker dismissViewControllerAnimated:YES completion:nil];
    
    UIImage *image = [self imageWithSourceImage:avatar scaledToSize:CGSizeMake(200, 200)];

    if (UIImagePNGRepresentation(avatar)) {
        //png
        self.imageData = UIImagePNGRepresentation(image);
    } else {
        self.imageData = UIImageJPEGRepresentation(image, 0.1);
    }
    
    id<OSSCredentialProvider> credential = [[OSSPlainTextAKSKPairCredentialProvider alloc]initWithPlainTextAccessKey:@"---------" secretKey:@"---------"];
    OSSClient *client = [[OSSClient alloc] initWithEndpoint:@"----------" credentialProvider:credential];
    OSSPutObjectRequest *putReq = [[OSSPutObjectRequest alloc] init];
    putReq.bucketName = @"---------";
    NSString *objectKeys = [NSString stringWithFormat:@"User/%@.jpg", [self getDifferentImageName]];
    putReq.objectKey = objectKeys;
    putReq.uploadingData = self.imageData;
    putReq.uploadProgress = ^(int64_t bytesSent, int64_t totalBytesSent, int64_t totalBytesExpectedToSend) {
        NSLog(@"bytesSent = %lld, totalBytesSent = %lld, totalBytesExpectedToSend = %lld", bytesSent, totalBytesSent, totalBytesExpectedToSend);
    };
    OSSTask *putTask = [client putObject:putReq];
    [putTask continueWithBlock:^id _Nullable(OSSTask * _Nonnull task) {
        task = [client presignPublicURLWithBucketName:@"-------" withObjectKey:objectKeys];
        NSLog(@"objectKey = %@", putReq.objectKey);
        if (!task.error) {
            NSLog(@"upload image success!");
        } else {
            NSLog(@"upload image failed!, error: %@", task.error);
        }
        return nil;
    }];
}

- (NSString *)getDifferentImageName {
    NSDateFormatter *formater = [[NSDateFormatter alloc] init];
    [formater setDateFormat:@"YYYYMMddhhmmssSSS"];
    NSString *date = [formater stringFromDate:[NSDate date]];
    return [NSString stringWithFormat:@"%@-%i", date, arc4random() % 10000];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
