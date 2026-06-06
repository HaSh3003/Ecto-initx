# SPDX-License-Identifier: MIT

CYAN='\033[0;36m'
GREEN='\033[1;32m'
PURPLE='\033[1;35m'
BLUE='\033[1;34m'
RED='\033[1;31m'
ORANGE='\033[0;33m'
YELLOW='\033[1;33m'
NC='\033[0m'

CPU=$(grep -m1 "model name" /proc/cpuinfo 2>/dev/null | cut -d: -f2 | xargs)
[ -z "$CPU" ] && CPU=$(lscpu 2>/dev/null | awk -F: '/Model name/ {gsub(/^ +| +$/,"",$2); print $2; exit}')
[ -z "$CPU" ] && CPU="Unknown"
[ ${#CPU} -gt 28 ] && CPU="${CPU:0:25}..."

RAM=$(free -h 2>/dev/null | awk '/^Mem:/ {print $2}')
[ -z "$RAM" ] && RAM="N/A"

DISK=$(df -h / 2>/dev/null | awk 'NR==2 {print $4 " free"}')
[ -z "$DISK" ] && DISK="N/A"

if [ -f /etc/os-release ]; then
    OS=$(. /etc/os-release && echo "${PRETTY_NAME:-$NAME}")
else
    OS=$(uname -s)
fi

CORES=$(nproc 2>/dev/null)
SYSINFO="CPU: $CPU (${CORES:-?} cores) | RAM: $RAM | Disk: $DISK | OS: $OS"

HOST=$(hostname -s 2>/dev/null || hostname 2>/dev/null || echo "your device")

goodbye() {
    echo -e "\n${BLUE}See you later!${NC}"
    exit 0
}
trap goodbye INT

clear
echo -e "${PURPLE}"
figlet -f small "Ecto-initx"
echo -e "${BLUE}by Hesham Yasser${NC}"
echo -e "${NC}-------------------------------------------------------"
echo -e "${CYAN}Welcome to ${HOST}! What would you like to build today?${NC}"
echo -e "${CYAN}${SYSINFO}${NC}"
echo -e "-------------------------------------------------------"
echo -e "${YELLOW}  Frontend${NC}"
echo -e "${GREEN}  1)${NC} ⚛️  React (Vite)"
echo -e "${GREEN}  2)${NC} ▲  Next.js"
echo -e "${GREEN}  3)${NC} 💚 Vue (Vite)"
echo -e "${GREEN}  4)${NC} 🟢 Nuxt"
echo -e "${GREEN}  5)${NC} 🔥 SvelteKit"
echo -e "${GREEN}  6)${NC} 👩‍🚀 Astro"
echo -e "${GREEN}  7)${NC} 🅰️  Angular"
echo -e "${GREEN}  8)${NC} 💿 Remix"
echo -e "${GREEN}  9)${NC} ⚡ SolidJS"
echo -e "${GREEN} 10)${NC} ⚡ Qwik"
echo -e "-------------------------------------------------------"
echo -e "${YELLOW}  Backend${NC}"
echo -e "${GREEN} 11)${NC} 🚀 Laravel (PHP)"
echo -e "${GREEN} 12)${NC} 🟩 NestJS (Node)"
echo -e "${GREEN} 13)${NC} 🟢 Express (Node)"
echo -e "-------------------------------------------------------"
echo -e "${YELLOW}  Mobile${NC}"
echo -e "${PURPLE} 14)${NC} 📱 React Native (Expo)"
echo -e "${PURPLE} 15)${NC} 📲 React Native CLI"
echo -e "-------------------------------------------------------"
echo -e "${YELLOW}  JS Add-ons${NC}"
echo -e "${GREEN} 16)${NC} 📦 Axios / Tailwind / React Router"
echo -e "-------------------------------------------------------"
echo -e "${RED} 17)${NC} ❌ Exit"
echo -e "-------------------------------------------------------"

read -p "Choose an option [1-17]: " choice

case $choice in
    1)
        read -p "Project Name: " name
        npm create vite@latest "$name" -- --template react
        cd "$name" && npm install
        echo -e "${GREEN}✔️ React project '$name' is ready!${NC}"
        code .
        ;;
    2)
        read -p "Project Name: " name
        npx create-next-app@latest "$name"
        echo -e "${GREEN}✔️ Next.js project '$name' is ready!${NC}"
        cd "$name" && code .
        ;;
    3)
        read -p "Project Name: " name
        npm create vite@latest "$name" -- --template vue
        cd "$name" && npm install
        echo -e "${GREEN}✔️ Vue project '$name' is ready!${NC}"
        code .
        ;;
    4)
        read -p "Project Name: " name
        npm create nuxt@latest "$name"
        echo -e "${GREEN}✔️ Nuxt project '$name' is ready!${NC}"
        cd "$name" && code .
        ;;
    5)
        read -p "Project Name: " name
        npm create svelte@latest "$name"
        echo -e "${GREEN}✔️ SvelteKit project '$name' is ready!${NC}"
        cd "$name" && code .
        ;;
    6)
        echo -e "${ORANGE}Launching Astro Setup Wizard...${NC}"
        npm create astro@latest
        echo -e "${GREEN}✔️ Astro project setup complete!${NC}"
        ;;
    7)
        read -p "Project Name: " name
        npx @angular/cli@latest new "$name"
        echo -e "${GREEN}✔️ Angular project '$name' is ready!${NC}"
        cd "$name" && code .
        ;;
    8)
        read -p "Project Name: " name
        npx create-remix@latest "$name"
        echo -e "${GREEN}✔️ Remix project '$name' is ready!${NC}"
        cd "$name" && code .
        ;;
    9)
        read -p "Project Name: " name
        npm create solid@latest "$name"
        echo -e "${GREEN}✔️ SolidJS project '$name' is ready!${NC}"
        cd "$name" && code .
        ;;
    10)
        read -p "Project Name: " name
        npm create qwik@latest "$name" empty
        echo -e "${GREEN}✔️ Qwik project '$name' is ready!${NC}"
        cd "$name" && code .
        ;;
    11)
        read -p "Project Name: " name
        composer create-project laravel/laravel "$name"
        echo -e "${GREEN}✔️ Laravel project '$name' created!${NC}"
        ;;
    12)
        read -p "Project Name: " name
        npx @nestjs/cli@latest new "$name"
        echo -e "${GREEN}✔️ NestJS project '$name' is ready!${NC}"
        cd "$name" && code .
        ;;
    13)
        read -p "Project Name: " name
        mkdir "$name" && cd "$name"
        npm init -y
        npm install express
        echo -e "${GREEN}✔️ Express project '$name' is ready!${NC}"
        code .
        ;;
    14)
        read -p "Project Name: " name
        npx create-expo-app "$name"
        echo -e "${PURPLE}📱 Expo project '$name' is ready!${NC}"
        cd "$name" && code .
        ;;
    15)
        read -p "Project Name: " name
        npx @react-native-community/cli@latest init "$name"
        echo -e "${PURPLE}📲 React Native CLI project '$name' is ready!${NC}"
        cd "$name" && code .
        ;;
    16)
        echo -e "${YELLOW}Which add-on do you want to install?${NC}"
        echo "1) Axios  2) Tailwind CSS  3) React Router"
        read -p "Select: " addon
        case $addon in
            1) npm install axios ;;
            2)
                npm install -D tailwindcss postcss autoprefixer
                npx tailwindcss init -p ;;
            3) npm install react-router-dom ;;
            *) echo -e "${RED}Invalid add-on!${NC}" ;;
        esac
        echo -e "${GREEN}✔️ Add-on installed successfully!${NC}"
        ;;
    17)
        goodbye
        ;;
    *)
        echo -e "${RED}Invalid option!${NC}"
        ;;
esac
