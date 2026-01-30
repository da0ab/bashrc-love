cat > .bashrc << 'EOF'

EOF

cat  exports.sh >> .bashrc
cat ../.bashrc.d/02-history.sh >> .bashrc
cat ../.bashrc.d/03-aliases.sh >> .bashrc
cat  alias.sh >> .bashrc
cat ../.bashrc.d/04-autocomplit.sh >> .bashrc
cat ../.bashrc.d/05-fzf-lsd-zoxide.sh >> .bashrc
cat ../.bashrc.d/06-prompt.sh >> .bashrc
cat ../.bashrc.d/08-lf.sh >> .bashrc
cat ../.bashrc.d/09-functions.sh >> .bashrc
cat  display.sh >> .bashrc 2>/dev/null

echo "Done"
