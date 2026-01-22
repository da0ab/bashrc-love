cat > termux/.bashrc << 'EOF'
# Generated from bashrc.d files
#--------------------
# $(date)
#--------------------

EOF

cat  termux/01-exports.sh >> termux/.bashrc
cat .bashrc.d/02-history.sh >> termux/.bashrc
cat .bashrc.d/03-aliases.sh >> termux/.bashrc
cat  termux/alias.sh >> termux/.bashrc
cat .bashrc.d/04-autocomplit.sh >> termux/.bashrc
cat .bashrc.d/05-fzf-lsd-zoxide.sh >> termux/.bashrc
cat .bashrc.d/06-prompt.sh >> termux/.bashrc
cat .bashrc.d/08-lf.sh >> termux/.bashrc
cat .bashrc.d/09-functions.sh >> termux/.bashrc
cat  termux/display.sh >> termux/.bashrc 2>/dev/null

echo "Done"
