
// import { Banner } from '../view/Banner';
// import { EnablementView } from '../view/EnablementView';
// import { TutorialView } from '../view/TutorialView';

// @Entry
@Component
export struct QuickStartPage {
  @State message: string = '快速入门111';
  // build 方法描述UI
  build() {
    Column() {
      Text(this.message)
        .fontSize(24)
        .fontWeight(700)
        .width('100%')
        .textAlign(TextAlign.Start)
        .padding({left: 16})
        .fontFamily('HarmonyHeiTi-Bold')
        .lineHeight(33)
      // Scroll() {
      //   Column() {
      //     // Banner()
      //     // EnablementView()
      //     // TutorialView()
      //   }
      // }
      // .layoutWeight(1)
      // // scrollBar设置为BarState.Off，表示关闭滚动时的滚动条显示
      // .scrollBar(BarState.Off)
      // .align(Alignment.TopStart)


    }
    .height('100%')
    .width('100%')
    .backgroundColor('#F1F3F5')
  }
}


