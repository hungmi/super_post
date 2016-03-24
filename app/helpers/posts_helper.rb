module PostsHelper
  def cities
    if I18n.locale == :'en'
      {"Keelung": "基隆市", "Taipei": "台北市", "Yilan": "宜蘭縣", "Hsinchu": "新竹市", "Hsinchu County": "新竹縣", "Taoyuan": "桃園市", "Miaoli": "苗栗縣", "Taichung": "台中市", "Changhua": "彰化縣", "Nantou": "南投縣", "Chiayi": "嘉義市", "Chiayi County": "嘉義縣", "Yunlin": "雲林縣", "Tainan": "台南市", "Kaohsiung": "高雄市", "Pingtung": "屏東縣", "Taitung": "台東縣", "Hualien": "花蓮縣", "Kinmen County": "金門縣", "Lienchiang County": "連江縣", "Penghu County": "澎湖縣"}
    else
      ["基隆市","台北市","宜蘭縣","新竹市","新竹縣","桃園市","苗栗縣","台中市","彰化縣","南投縣","嘉義市","嘉義縣","雲林縣","台南市","高雄市","屏東縣","台東縣","花蓮縣","金門縣","連江縣","澎湖縣"]
    end
  end

  def render_main_btn(text = nil, path = "#", html_options = {class:nil, id:nil})
    default_class = "ui button yellow main-bottom-btn"
    html_options[:class] = "#{default_class} #{html_options[:class]}"
    link_to path, html_options do
      text
    end
  end
end
