#! bash oh-my-bash.module
SCM_THEME_PROMPT_DIRTY=" ${_omb_prompt_brown}✗"
SCM_THEME_PROMPT_CLEAN=" ${_omb_prompt_bold_green}✓"
SCM_THEME_PROMPT_PREFIX=" |"
SCM_THEME_PROMPT_SUFFIX="${_omb_prompt_green}|"

GIT_THEME_PROMPT_DIRTY=" ${_omb_prompt_brown}✗"
GIT_THEME_PROMPT_CLEAN=" ${_omb_prompt_bold_green}✓"
GIT_THEME_PROMPT_PREFIX=" ${_omb_prompt_olive}|"
GIT_THEME_PROMPT_SUFFIX="${_omb_prompt_olive}|"

RVM_THEME_PROMPT_PREFIX="|"
RVM_THEME_PROMPT_SUFFIX="|"

function _omb_theme_PROMPT_COMMAND() {
    PS1="${_omb_prompt_light_blue}\h:${_omb_prompt_reset_color} ${_omb_prompt_green}\w${_omb_prompt_olive}$(scm_prompt_info)${_omb_prompt_reset_color}→ "
    #PS1="${_omb_prompt_green}\u@${_omb_prompt_olive}\h:${_omb_prompt_reset_color}${_omb_prompt_green}\w${_omb_prompt_olive}$(scm_prompt_info)${_omb_prompt_reset_color}→ "
}

_omb_util_add_prompt_command _omb_theme_PROMPT_COMMAND

