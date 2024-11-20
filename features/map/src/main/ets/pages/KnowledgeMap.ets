import {  NavBarItemType, NavBarItem } from '../view/NavBarItem';
import { KnowledgeMapContent, Section } from '../view/KnowledgeMapContent';


@Component
export struct KnowledgeMap {
  @State message: string = 'Hello World';
  @State navBarList: NavBarItemType[] = [
    { order: '01', title: '准备与学习' },
    { order: '02', title: '构建应用' },
    { order: '03', title: '应用测试' },
    { order: '04', title: '上架' },
    { order: '05', title: '运营增长' },
    { order: '06', title: '商业变现' },
    { order: '07', title: '更多' }
  ];

  @State sections: Section[] = [
    {
      "title": "准备与学习",
      "brief": "加入HarmonyOS生态，注册成为开发者，通过HarmonyOS课程了解基本概念和基础知识，轻松开启HarmonyOS的开发旅程。",
      "materials": [
        {
          "subtitle": "HarmonyOS简介",
          "knowledgeBase": [
            {
              "type": "准备",
              "title": "注册账号"
            },
            {
              "type": "准备",
              "title": "实名认证"
            },
            {
              "type": "学习与获取证书",
              "title": "HarmonyOS第一课"
            },
            {
              "type": "学习与获取证书",
              "title": "HarmonyOS应用开发者基础认证"
            }
          ]
        },
        {
          "subtitle": "赋能套件介绍",
          "knowledgeBase": [
            {
              "type": "指南",
              "title": "开发"
            },
            {
              "type": "指南",
              "title": "最佳实践"
            },
            {
              "type": "指南",
              "title": "API参考"
            },
            {
              "type": "指南",
              "title": "视频教程"
            },
            {
              "type": "指南",
              "title": "Codelabs"
            },
            {
              "type": "指南",
              "title": "FAQ"
            }
          ]
        }
      ]
    },
    {
      "title": "构建应用",
      "brief": "为了帮助开发者更好的理解HarmonyOS提供的能力，我们对重点功能提供了开发指导，辅助开发者完成应用的开发。",
      "materials": [
        {
          "subtitle": "开发工具",
          "knowledgeBase": [
            {
              "type": "指南",
              "title": "DevEco Studio"
            },
            {
              "type": "指南",
              "title": "低代码开发"
            },
            {
              "type": "视频教程",
              "title": "使用DevEco Studio高效开发"
            }
          ]
        },
        {
          "subtitle": "开发语言",
          "knowledgeBase": [
            {
              "type": "指南",
              "title": "ArkTS"
            },
            {
              "type": "视频教程",
              "title": "ArkTS基础知识"
            },
            {
              "type": "视频教程",
              "title": "ArkTS开发实践"
            }
          ]
        },
        {
          "subtitle": "开发框架",
          "knowledgeBase": [
            {
              "type": "指南",
              "title": "ArkTS"
            },
            {
              "type": "视频教程",
              "title": "ArkUI之属性动画"
            }
          ]
        },
        {
          "subtitle": "HarmonyOS云开发",
          "knowledgeBase": [
            {
              "type": "指南",
              "title": "体验HarmonyOS云开发"
            },
            {
              "type": "指南",
              "title": "云开发"
            },
            {
              "type": "视频教程",
              "title": "HarmonyOS云开发"
            }
          ]
        },
        {
          "subtitle": "集成开放能力",
          "knowledgeBase": [
            {
              "type": "指南",
              "title": "推送服务"
            },
            {
              "type": "指南",
              "title": "广告服务"
            },
            {
              "type": "指南",
              "title": "帐号服务"
            },
            {
              "type": "指南",
              "title": "分析服务"
            },
            {
              "type": "指南",
              "title": "应用内支付服务"
            },
            {
              "type": "指南",
              "title": "云函数"
            },
            {
              "type": "指南",
              "title": "云存储"
            },
            {
              "type": "指南",
              "title": "云数据库"
            }
          ]
        },
        {
          "subtitle": "编译调试",
          "knowledgeBase": [
            {
              "type": "指南",
              "title": "编译构建"
            },
            {
              "type": "指南",
              "title": "应用签名"
            },
            {
              "type": "指南",
              "title": "云调试"
            },
            {
              "type": "视频教程",
              "title": "HarmonyOS应用调试前准备"
            },
            {
              "type": "视频教程",
              "title": "HarmonyOS应用调试"
            },
            {
              "type": "视频教程",
              "title": "HarmonyOS调试工具介绍"
            }
          ]
        }
      ]
    },
    {
      "title": "应用测试",
      "brief": "HarmonyOS应用/服务开发完成后，在发布到应用/服务市场前，还需要对应用进行：漏洞、隐私、兼容性、稳定性、性能等测试，确保HarmonyOS应用/服务纯净、安全，给用户带来更好的使用体验。",
      "materials": [
        {
          "subtitle": "",
          "knowledgeBase": [
            {
              "type": "指南",
              "title": "云测试"
            },
            {
              "type": "指南",
              "title": "开放式测试"
            }
          ]
        }
      ]
    },
  ];

  @Provide('knowledgeMapPageStack') knowledgeMapPageStack: NavPathStack = new NavPathStack();
  @State currentNavBarIndex: number = -1;



  @Builder
  PageMap(name: string) {
    if (name === 'KnowledgeMapContent') {
      KnowledgeMapContent({ section: this.sections[this.currentNavBarIndex] });
    }
  }

  build() {
    // Navigation(this.knowledgeMapPageStack) {
    //   Scroll(this.scroller) {
    //     KnowledgeMapContent({
    //       section: this.sections
    //     })
    //   }
    //   .align(Alignment.TopStart)
    //   .constraintSize({ minHeight: '100%' })
    //   .edgeEffect(EdgeEffect.Spring)
    //   .scrollable(ScrollDirection.Vertical)
    //   .scrollBar(BarState.Auto)
    //   .backgroundColor('#F1F3F5')
    // }
    // .hideTitleBar(true)
    // .navDestination(this.PageMap)
    // .mode(NavigationMode.Stack)

    Navigation(this.knowledgeMapPageStack) {
      // Scroll() {
        Column() {
          Text('知识地图')
            .fontFamily('HarmonyHeiTi-Bold')
            .fontSize(24)
            .fontColor(Color.Black)
            .textAlign(TextAlign.Start)
            .lineHeight(33)
            .fontWeight(700)
            .width('100%')
          Image($r('app.media.knowledge_map_banner'))
            .width('100%')
            .borderRadius(16)
            .margin({ top: 19, bottom: 8 })
          Text('通过循序渐进的学习路径，无经验和有经验的开发者都可以轻松掌握ArkTS语言声明式开发范式，体验更简洁、更友好的HarmonyOS应用开发旅程。')
            .fontFamily('HarmonyHeiTi')
            .fontSize(14)
            .fontColor('rgba(0,0,0,0.60)')
            .fontWeight(400)
            .textAlign(TextAlign.Start)
          List({ space: 12 }) {
            ForEach(this.navBarList, (item: NavBarItemType, index: number) => {
              ListItem() {
                NavBarItem({ navBarItem: item, currentNavBarIndex: this.currentNavBarIndex })
              }
              .width('100%')
            }, (item: NavBarItemType): string => item.title)
          }
          .width('100%')
          .margin({ top: 24 })
        }
        .padding({ top: 12, right: 16, bottom: 12, left: 16})
        .backgroundColor('#F1F3F5')
      // }
      // .backgroundColor('#F1F3F5')
      // .align(Alignment.TopStart)
      // .constraintSize({ minHeight: '100%' })
      // .edgeEffect(EdgeEffect.Spring)
    }
    .hideTitleBar(true)
    .navDestination(this.PageMap)
    .mode(NavigationMode.Stack)
  }
}
