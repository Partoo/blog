---
title: 'API DEMO'
date: 2022-12-11
draft: false
---

韩你看一下大体的格式，这是登录验证及获取登录后信息部分的，比如所有请求返还的键名还有错误码你可以定一下，我现在这里按若依每个请求都有一个 `code` 放 状态码， 然后 `msg` 放相关提示
```json
1. 登录验证码

Request URL: http://localhost:1024/dev-api/captchaImage
Request Method: GET

{
    "msg": "操作成功",
    "img": "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",
    "code": 200,
    "captchaEnabled": true,
    "uuid": "d83283a18747443d8eea11650a6fc401"
}

2. 登录成功返回
Request URL: http://localhost:1024/dev-api/login
Request Method: POST
{"username":"admin","password":"admin123","code":"16","uuid":"245c726046064992b54777d32676909b"}


{
    "msg": "操作成功",
    "code": 200,
    "token": "eyJhbGciOiJIUzUxMiJ9.eyJsb2dpbl91c2VyX2tleSI6IjBmNjVhN2YwLWEzNjAtNDQ5Yi1iMjAzLTdhNTNhNGNiNTIzMCJ9.1XhaMOzjMj2dVLN5YhEehsRSmudVqRohRrP6W375KvkFr5Qe6ku3n90C-es9uiGTTlqebBxFx95qkBp3jdv02A"
}

3. 登录用户信息
Request URL: http://localhost:1024/dev-api/getInfo
Request Method: GET
Authorization:Bearer eyJhbGciOiJIUzUxMiJ9.eyJsb2dpbl91c2VyX2tleSI6IjBmNjVhN2YwLWEzNjAtNDQ5Yi1iMjAzLTdhNTNhNGNiNTIzMCJ9.1XhaMOzjMj2dVLN5YhEehsRSmudVqRohRrP6W375KvkFr5Qe6ku3n90C-es9uiGTTlqebBxFx95qkBp3jdv02A
{
    "msg": "操作成功",
    "code": 200,
    "permissions": [
        "*:*:*"
    ],
    "roles": [
        "admin"
    ],
    "user": {
        "createBy": "admin",
        "createTime": "2022-12-07 21:15:39",
        "updateBy": null,
        "updateTime": null,
        "remark": "管理员",
        "userId": 1,
        "deptId": 103,
        "userName": "admin",
        "nickName": "若依",
        "email": "ry@163.com",
        "phonenumber": "15888888888",
        "sex": "1",
        "avatar": "",
        "password": "$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2",
        "status": "0",
        "delFlag": "0",
        "loginIp": "127.0.0.1",
        "loginDate": "2022-12-07T21:26:39.000+08:00",
        "dept": {
            "createBy": null,
            "createTime": null,
            "updateBy": null,
            "updateTime": null,
            "remark": null,
            "deptId": 103,
            "parentId": 101,
            "ancestors": "0,100,101",
            "deptName": "研发部门",
            "orderNum": 1,
            "leader": "若依",
            "phone": null,
            "email": null,
            "status": "0",
            "delFlag": null,
            "parentName": null,
            "children": []
        },
        "roles": [
            {
                "createBy": null,
                "createTime": null,
                "updateBy": null,
                "updateTime": null,
                "remark": null,
                "roleId": 1,
                "roleName": "超级管理员",
                "roleKey": "admin",
                "roleSort": 1,
                "dataScope": "1",
                "menuCheckStrictly": false,
                "deptCheckStrictly": false,
                "status": "0",
                "delFlag": null,
                "flag": false,
                "menuIds": null,
                "deptIds": null,
                "permissions": null,
                "admin": true
            }
        ],
        "roleIds": null,
        "postIds": null,
        "roleId": null,
        "admin": true
    }
}

4. 登录用户菜单
Request URL: http://localhost:1024/dev-api/getRouters
Request Method: GET
Bearer eyJhbGciOiJIUzUxMiJ9.eyJsb2dpbl91c2VyX2tleSI6IjBmNjVhN2YwLWEzNjAtNDQ5Yi1iMjAzLTdhNTNhNGNiNTIzMCJ9.1XhaMOzjMj2dVLN5YhEehsRSmudVqRohRrP6W375KvkFr5Qe6ku3n90C-es9uiGTTlqebBxFx95qkBp3jdv02A
{
    "msg": "操作成功",
    "code": 200,
    "data": [
        {
            "name": "System",
            "path": "/system",
            "hidden": false,
            "redirect": "noRedirect",
            "component": "Layout",
            "alwaysShow": true,
            "meta": {
                "title": "系统管理",
                "icon": "system",
                "noCache": false,
                "link": null
            },
            "children": [
                {
                    "name": "User",
                    "path": "user",
                    "hidden": false,
                    "component": "system/user/index",
                    "meta": {
                        "title": "用户管理",
                        "icon": "user",
                        "noCache": false,
                        "link": null
                    }
                },
                {
                    "name": "Role",
                    "path": "role",
                    "hidden": false,
                    "component": "system/role/index",
                    "meta": {
                        "title": "角色管理",
                        "icon": "peoples",
                        "noCache": false,
                        "link": null
                    }
                },
                {
                    "name": "Menu",
                    "path": "menu",
                    "hidden": false,
                    "component": "system/menu/index",
                    "meta": {
                        "title": "菜单管理",
                        "icon": "tree-table",
                        "noCache": false,
                        "link": null
                    }
                },
                {
                    "name": "Dept",
                    "path": "dept",
                    "hidden": false,
                    "component": "system/dept/index",
                    "meta": {
                        "title": "部门管理",
                        "icon": "tree",
                        "noCache": false,
                        "link": null
                    }
                },
                {
                    "name": "Post",
                    "path": "post",
                    "hidden": false,
                    "component": "system/post/index",
                    "meta": {
                        "title": "岗位管理",
                        "icon": "post",
                        "noCache": false,
                        "link": null
                    }
                },
                {
                    "name": "Dict",
                    "path": "dict",
                    "hidden": false,
                    "component": "system/dict/index",
                    "meta": {
                        "title": "字典管理",
                        "icon": "dict",
                        "noCache": false,
                        "link": null
                    }
                },
                {
                    "name": "Config",
                    "path": "config",
                    "hidden": false,
                    "component": "system/config/index",
                    "meta": {
                        "title": "参数设置",
                        "icon": "edit",
                        "noCache": false,
                        "link": null
                    }
                },
                {
                    "name": "Notice",
                    "path": "notice",
                    "hidden": false,
                    "component": "system/notice/index",
                    "meta": {
                        "title": "通知公告",
                        "icon": "message",
                        "noCache": false,
                        "link": null
                    }
                },
                {
                    "name": "Log",
                    "path": "log",
                    "hidden": false,
                    "redirect": "noRedirect",
                    "component": "ParentView",
                    "alwaysShow": true,
                    "meta": {
                        "title": "日志管理",
                        "icon": "log",
                        "noCache": false,
                        "link": null
                    },
                    "children": [
                        {
                            "name": "Operlog",
                            "path": "operlog",
                            "hidden": false,
                            "component": "monitor/operlog/index",
                            "meta": {
                                "title": "操作日志",
                                "icon": "form",
                                "noCache": false,
                                "link": null
                            }
                        },
                        {
                            "name": "Logininfor",
                            "path": "logininfor",
                            "hidden": false,
                            "component": "monitor/logininfor/index",
                            "meta": {
                                "title": "登录日志",
                                "icon": "logininfor",
                                "noCache": false,
                                "link": null
                            }
                        }
                    ]
                }
            ]
        },
        {
            "name": "Monitor",
            "path": "/monitor",
            "hidden": false,
            "redirect": "noRedirect",
            "component": "Layout",
            "alwaysShow": true,
            "meta": {
                "title": "系统监控",
                "icon": "monitor",
                "noCache": false,
                "link": null
            },
            "children": [
                {
                    "name": "Online",
                    "path": "online",
                    "hidden": false,
                    "component": "monitor/online/index",
                    "meta": {
                        "title": "在线用户",
                        "icon": "online",
                        "noCache": false,
                        "link": null
                    }
                },
                {
                    "name": "Job",
                    "path": "job",
                    "hidden": false,
                    "component": "monitor/job/index",
                    "meta": {
                        "title": "定时任务",
                        "icon": "job",
                        "noCache": false,
                        "link": null
                    }
                },
                {
                    "name": "Druid",
                    "path": "druid",
                    "hidden": false,
                    "component": "monitor/druid/index",
                    "meta": {
                        "title": "数据监控",
                        "icon": "druid",
                        "noCache": false,
                        "link": null
                    }
                },
                {
                    "name": "Server",
                    "path": "server",
                    "hidden": false,
                    "component": "monitor/server/index",
                    "meta": {
                        "title": "服务监控",
                        "icon": "server",
                        "noCache": false,
                        "link": null
                    }
                },
                {
                    "name": "Cache",
                    "path": "cache",
                    "hidden": false,
                    "component": "monitor/cache/index",
                    "meta": {
                        "title": "缓存监控",
                        "icon": "redis",
                        "noCache": false,
                        "link": null
                    }
                },
                {
                    "name": "CacheList",
                    "path": "cacheList",
                    "hidden": false,
                    "component": "monitor/cache/list",
                    "meta": {
                        "title": "缓存列表",
                        "icon": "redis-list",
                        "noCache": false,
                        "link": null
                    }
                }
            ]
        },
        {
            "name": "Tool",
            "path": "/tool",
            "hidden": false,
            "redirect": "noRedirect",
            "component": "Layout",
            "alwaysShow": true,
            "meta": {
                "title": "系统工具",
                "icon": "tool",
                "noCache": false,
                "link": null
            },
            "children": [
                {
                    "name": "Build",
                    "path": "build",
                    "hidden": false,
                    "component": "tool/build/index",
                    "meta": {
                        "title": "表单构建",
                        "icon": "build",
                        "noCache": false,
                        "link": null
                    }
                },
                {
                    "name": "Gen",
                    "path": "gen",
                    "hidden": false,
                    "component": "tool/gen/index",
                    "meta": {
                        "title": "代码生成",
                        "icon": "code",
                        "noCache": false,
                        "link": null
                    }
                },
                {
                    "name": "Swagger",
                    "path": "swagger",
                    "hidden": false,
                    "component": "tool/swagger/index",
                    "meta": {
                        "title": "系统接口",
                        "icon": "swagger",
                        "noCache": false,
                        "link": null
                    }
                }
            ]
        },
        {
            "name": "Http://ruoyi.vip",
            "path": "http://ruoyi.vip",
            "hidden": false,
            "component": "Layout",
            "meta": {
                "title": "若依官网",
                "icon": "guide",
                "noCache": false,
                "link": "http://ruoyi.vip"
            }
        }
    ]
}
```