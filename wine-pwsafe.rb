# Documentation: http://docs.brew.sh/Formula-Cookbook.html
#                http://www.rubydoc.info/github/Homebrew/brew/master/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!

class WinePwsafe < Formula
  desc ""
  homepage ""
  url "https://www.fosshub.com/Password-Safe.html/pwsafe-3.41.0.exe"
  version "3.41.0-1"
  sha256 "72b542bccb6a44ec23228180aa207b173c4f5fa57d5c9f53fae49ed16f40cd59"

  # depends_on "cmake" => :build
  depends_on "wine" => [:optional, "without-x11"]

  def install
    # ENV.deparallelize  # if your formula fails when building in parallel
    ENV.append "WINEPREFIX", "./prefix"
    system "wine", "pwsafe-3.41.0.exe"
    ### NOT WORKING
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! It's enough to just replace
    # "false" with the main program this formula installs, but it'd be nice if you
    # were more thorough. Run the test with `brew test wine-pwsafe`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    system "false"
  end
end
