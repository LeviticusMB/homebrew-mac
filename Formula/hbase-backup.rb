class HbaseBackup < Formula
  desc "An online snapshot-based backup script for small-to-medium-sized HBase tables"
  homepage "https://github.com/LeviticusMB/hbase-backup"
  url "https://github.com/LeviticusMB/hbase-backup/archive/v2015-10-17.tar.gz"
  version "2015-10-17"
  sha256 "3db4ec86ba2442e05bcb87d8627842814b0b0b41783642004f0425277a1b19d4"

  depends_on "hbase" => :recommended
  depends_on :python => :recommended

  def install
    bin.install "hbase-backup-table.rb"
    bin.install "hbase-backup-util-untar.py"
    libexec.install Dir["hbase-backup-cmd-*"]
  end

  def caveats; <<-EOS.undent
    The example backup commands have been installed to #{libexec}.
    Please note that this program depends on a working HDFS/NFS mountpoint.
    EOS
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! It's enough to just replace
    # "false" with the main program this formula installs, but it'd be nice if you
    # were more thorough. Run the test with `brew test hbase-backup`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    system "false"
  end
end
