cask "chatty" do
  version "0.13.1"
  sha256 "b92910ad1e7df29fcd7e5d8f61a47efc641767c8bdf1828f4f18e7a0b79413d3"

  # github.com/chatty/chatty/ was verified as official when first introduced to the cask
  url "https://github.com/chatty/chatty/releases/download/v#{version}/Chatty_#{version}.zip"
  appcast "https://github.com/chatty/chatty/releases.atom"
  name "Chatty"
  homepage "https://chatty.github.io/"

  suite "Chatty"

  preflight do
    # There is no sub-folder in the ZIP; the root *is* the folder
    FileUtils.mv(staged_path.children, staged_path.join("Chatty").tap(&:mkpath))
  end

  zap trash: "~/.chatty"

  caveats do
    depends_on_java "7+"
  end
end
