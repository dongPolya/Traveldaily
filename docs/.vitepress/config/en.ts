import { defineConfig} from 'vitepress'

import { createSideBarEN } from "../theme/utils/createSideBar";

const sideBarConfig = createSideBarEN();
// const firstNoteItemLink = sideBarConfig['/en/notes/'][0].items[0].link

// https://vitepress.dev/reference/site-config
export default defineConfig({
  title: "TravelDaily",
  description: "Travel Journal: Sharing Fresh Updates.",
  lang: "en-US", //语言

  themeConfig: {
    // https://vitepress.dev/reference/default-theme-config
    nav: [
			{ text: "Blog", link: "/en/" },
      { text: "Archive", link: "/en/archive/", activeMatch: '/en/archive/' },
			// { text: "Notes", link: firstNoteItemLink, activeMatch: '/en/notes/' },
			{ text: "About", link: "/en/about", activeMatch: '/en/about' },
			{ text: "Sponsor", link: "/en/support-me", activeMatch: '/en/support-me' },
    ],
    footer: {
      message: 'Copyright © 2026-present <a href="http://traveldaily.top/about">TravelDaily</a>.' +
      '&nbsp;&nbsp;&nbsp;✧ <a href="https://fbll.asia">tavel_hub</a>.' +   
      '&nbsp;&nbsp;&nbsp;✧ <a href="https://github.com/dongPolya/Traveldaily">open in Github</a>',
      
    },

    sidebar: sideBarConfig,

   socialLinks: [
      { icon: 'x', link: 'https://pkp.sfu.ca/' },
      { icon: 'github', link: 'https://github.com/dongPolya' },
      {
        icon: {
          svg: '<img src="https://randomuser.me/api/portraits/lego/1.jpg" style="width:20px;height:20px;" />'},
        link: "https://fbll.asia/",
      },
    ],


    editLink: {
      pattern: "https://github.com/dongPolya/Traveldaily/edit/main/docs/en/:path"
    },
  },
})
