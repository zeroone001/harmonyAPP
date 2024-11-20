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

  @State section: Section = {
    "title": "构建应用",
    "brief": "为了帮助开发者更好的理解HarmonyOS提供的能力，我们对重点功能提供了开发指导，辅助开发者完成应用的开发。",
    "materials": [
      {
        "subtitle": "开发工具",
        "knowledgeBase": [
          { "type": "指南", "title": "DevEco Studio" },
          { "type": "指南", "title": "低代码开发" },
          { "type": "视频教程", "title": "使用DevEco Studio高效开发" }
        ]
      },
      {
        "subtitle": "开发语言",
        "knowledgeBase": [
          { "type": "指南", "title": "ArkTS" },
          { "type": "视频教程", "title": "ArkTS基础知识" },
          { "type": "指南", "title": "ArkTS开发实践" }
        ]
      },
      {
        "subtitle": "开发框架",
        "knowledgeBase": [
          { "type": "指南", "title": "ArkTS" },
          { "type": "视频教程", "title": "ArkUI之属性动画" }
        ]
      }
    ]
  };

  scroller: Scroller = new Scroller();


  build() {
    Scroll(this.scroller) {
      KnowledgeMapContent({
        section: this.section
      })
    }
    .align(Alignment.TopStart)
    .constraintSize({ minHeight: '100%' })
    .edgeEffect(EdgeEffect.Spring)
    .scrollable(ScrollDirection.Vertical)
    .scrollBar(BarState.Auto)
    .backgroundColor('#F1F3F5')
    // Scroll() {
    //   Column() {
    //     Text('知识地图')
    //       .fontFamily('HarmonyHeiTi-Bold')
    //       .fontSize(24)
    //       .fontColor(Color.Black)
    //       .textAlign(TextAlign.Start)
    //       .lineHeight(33)
    //       .fontWeight(700)
    //       .width('100%')
    //     Image($r('app.media.knowledge_map_banner'))
    //       .width('100%')
    //       .borderRadius(16)
    //       .margin({ top: 19, bottom: 8 })
    //     Text('通过循序渐进的学习路径，无经验和有经验的开发者都可以轻松掌握ArkTS语言声明式开发范式，体验更简洁、更友好的HarmonyOS应用开发旅程。')
    //       .fontFamily('HarmonyHeiTi')
    //       .fontSize(14)
    //       .fontColor('rgba(0,0,0,0.60)')
    //       .fontWeight(400)
    //       .textAlign(TextAlign.Start)
    //     List({ space: 12 }) {
    //       ForEach(this.navBarList, (item: NavBarItemType, index: number) => {
    //         ListItem() {
    //           NavBarItem({ navBarItem: item })
    //         }
    //         .width('100%')
    //       }, (item: NavBarItemType): string => item.title)
    //     }
    //     .width('100%')
    //     .margin({ top: 24 })
    //   }
    //   .padding({ top: 12, right: 16, bottom: 12, left: 16})
    //   .backgroundColor('#F1F3F5')
    // }
    // .backgroundColor('#F1F3F5')
    // .align(Alignment.TopStart)
    // .constraintSize({ minHeight: '100%' })
    // .edgeEffect(EdgeEffect.Spring)

  }
}
