# ~/.zshrc — Configuración recomendada para usar con Powerlevel10k
# - instala/usa MesloLGS NF (recomendado por p10k)
# - añade zsh-autosuggestions, zsh-syntax-highlighting y fzf si los tienes

# --- Config básica
export ZSH="$HOME/.oh-my-zsh"          # si usas oh-my-zsh (opcional)
HISTFILE="$HOME/.zsh_history"
HISTSIZE=10000
SAVEHIST=10000
setopt APPEND_HISTORY \
       SHARE_HISTORY \
       INC_APPEND_HISTORY \
       HIST_EXPIRE_DUPS_FIRST \
       AUTO_MENU \
       CORRECT_ALL

# Acelera el prompt al inicio
# Si usas powerlevel10k, activa instant prompt (mejora arranque interactivo)
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# --- PATH / utilidades (ajusta a tu sistema)
export PATH="$HOME/bin:$HOME/.local/bin:$PATH"

# --- Plugins (instalación recomendada)
# Instalar:
# git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
# git clone https://github.com/zsh-users/zsh-syntax-highlighting ~/.zsh/zsh-syntax-highlighting
# git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf && ~/.fzf/install
# Antes de source zsh-autosuggestions, configura el estilo:
# Usa hex si tu terminal soporta truecolor; si no, usa 'fg=blue' o 'fg=75' como fallback.
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=#7aa2f7,bold'
# Configurar estilos para zsh-syntax-highlighting (definir antes de source)
typeset -gA ZSH_HIGHLIGHT_STYLES
ZSH_HIGHLIGHT_STYLES[command]="fg=#7aa2f7"
ZSH_HIGHLIGHT_STYLES[alias]="fg=#7aa2f7"
ZSH_HIGHLIGHT_STYLES[builtin]="fg=#7aa2f7"
ZSH_HIGHLIGHT_STYLES[unknown]="fg=#f7768e"     # por ejemplo errores en rojo


# Carga plugins si existen
[ -f "$HOME/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh" ] && source "$HOME/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh"
[ -f "$HOME/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" ] && source "$HOME/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
[ -f "$HOME/.fzf.zsh" ] && source "$HOME/.fzf.zsh"

# fzf default bindings (si instalaste fzf)
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Alias y helpers útiles
alias ll='ls -lha'
alias la='ls -A'
alias g='git'

# Editor
export EDITOR="${EDITOR:-nvim}"

# --- Powerlevel10k
# Instalar Powerlevel10k:
# git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/.powerlevel10k
# Si lo instalaste, carga el tema:
if [ -f ~/.powerlevel10k/powerlevel10k.zsh-theme ]; then
  source ~/.powerlevel10k/powerlevel10k.zsh-theme
fi

# Carga tu configuración p10k si existe
[ -f ~/.p10k.zsh ] && source ~/.p10k.zsh

# --- Extras visuales / rendimiento
# Reduce el jitter del prompt
typeset -g POWERLEVEL9K_DISABLE_CONFIGURATION_WIZARD=true

# Prompt en pantalla completa (opcional)
# export TERM=xterm-256color

# --- Fin del archivo
# Ejecuta exec zsh o abre una nueva terminal para aplicar cambios
