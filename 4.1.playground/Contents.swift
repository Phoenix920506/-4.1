import Cocoa

let fileManager = FileManager.default
let docPath = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first?.path

var file = docPath?.appending("/01")
if fileManager.fileExists(atPath: file!){
    let image = file?.appending("1.jpg")
    if fileManager.fileExists(atPath: image!){
        print("exist")
    }
    else{
        let url = URL(string: "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1543483911397&di=62bf1eb28b946bf0cc67c31f0c831a42&imgtype=0&src=http%3A%2F%2Fb-ssl.duitang.com%2Fuploads%2Fitem%2F201801%2F30%2F20180130195209_feidn.jpg")
        let data = try Data(contentsOf: url!)
        try data.write(to:URL(fileURLWithPath: image!),options: .atomicWrite)
    }
}
else{
    try fileManager.createDirectory(atPath: file!, withIntermediateDirectories: true, attributes: nil)
    print("file not exist,create a new file")
}

