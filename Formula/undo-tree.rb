class UndoTree < Formula
  desc "Branching undo mode for Emacs"
  homepage "http://www.dr-qubit.org/emacs.php#undo-tree"
  url "http://elpa.gnu.org/packages/undo-tree-0.6.5.el"
  sha256 "67b4842cc3cafa5a8b15adc89e6db37e8367f5078fd2d4d5df723ade7d3f492f"
  head "http://www.dr-qubit.org/git/undo-tree.git"

  def install
    version_string = build.stable? ? "-#{version}" : ""
    (share/"emacs/site-lisp/undo-tree").install "undo-tree#{version_string}.el" => "undo-tree.el"
  end

  test do
    (testpath/"test.el").write <<-EOS.undent
      (add-to-list 'load-path "#{HOMEBREW_PREFIX}/share/emacs/site-lisp")
      (load "undo-tree")
      (global-undo-tree-mode)
      (print (minibuffer-prompt-width))
    EOS
    assert_equal "0", shell_output("emacs -batch -l #{testpath}/test.el").strip
  end
end