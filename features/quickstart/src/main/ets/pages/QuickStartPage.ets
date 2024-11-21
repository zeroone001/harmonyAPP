
import { Banner } from '../view/Banner';
import { EnablementView } from '../view/EnablementView';
import { TutorialView } from '../view/TutorialView';

import { ArticleDetailPage } from './ArticleDetailPage';
import { BannerDetailPage } from './BannerDetailPage';

import { ArticleClass } from '../model/ArticleClass';
import { BannerClass } from '../model/BannerClass';

import { Header } from '../view/Header';

// @Entry
@Component
export struct QuickStartPage {
  @State message: string = '快速入门111';
  // 在这里定义 new NavPathStack();
  @Provide('articlePathStack') articlePathStack: NavPathStack = new NavPathStack();

  @Builder
  quickStartRouter(name: string, param?: ArticleClass | BannerClass) {
    if (name === 'articleDetail') {
      ArticleDetailPage()
    } else if (name === 'bannerDetailPage') {
      BannerDetailPage()
    }
  }
  // build 方法描述UI
  build() {
    Navigation(this.articlePathStack) {
      Scroll() {
        Column() {
          Header()
          Banner()
          EnablementView()
          TutorialView()
        }
      }
      .layoutWeight(1)
      // scrollBar设置为BarState.Off，表示关闭滚动时的滚动条显示
      .scrollBar(BarState.Off)
      .align(Alignment.TopStart)
    }
    // 使用navDestination来关联Navigation组件与路由表
    .navDestination(this.quickStartRouter)
    // 使用hideTitleBar来隐藏自带的标题栏
    .hideTitleBar(true)
    // 使用mode属性控制Navigation的布局模式
    .mode(NavigationMode.Stack)
  }
}


