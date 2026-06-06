# Ecto-initx

A simple Bash script — one menu in the terminal so you can spin up a new project without googling the right command every time.

---

## What's the point?

Starting a new project usually means hunting down the right command: `create-vite`, `create-next-app`, `composer create-project`... It takes time, and it's easy to get wrong.

**Ecto-initx** puts all of that in one place. Run the script, pick a number, type a project name, done.

---

## How to run it

```bash
cd "/path/to/initx"
./initx.sh
```

If you get `Permission denied`:

```bash
chmod +x initx.sh
./initx.sh
```

### Run it from anywhere (optional)

```bash
sudo ln -s "/path/to/initx/initx.sh" /usr/local/bin/initx
initx
```

---

## What shows up when you launch it?

- The **Ecto-initx** title (via figlet)
- A **Hesham Yasser** signature
- A welcome message using your machine name — e.g. `Welcome to Ecto-systems!`
- A one-liner with system info: CPU, RAM, free disk space, and OS
- A menu split into sections: Frontend → Backend → Mobile → JS Add-ons

Hit **Ctrl+C** anytime — it'll say `See you later!` and exit cleanly.

---

## What do you need installed?

| Tool | Used for |
|------|----------|
| `figlet` | The banner in the terminal — `sudo apt install figlet` |
| `npm` / `npx` | Most frontend and mobile projects |
| `composer` | Laravel |
| `code` | VS Code (optional — opens the project after scaffolding) |

React Native CLI also needs Android Studio or Xcode, depending on your target platform.

---

## The menu — what to pick

### Frontend (1–10)

| # | Project | Notes |
|---|---------|-------|
| 1 | React (Vite) | Fast and straightforward |
| 2 | Next.js | React with SSR — may launch an interactive wizard |
| 3 | Vue (Vite) | |
| 4 | Nuxt | Vue with SSR |
| 5 | SvelteKit | |
| 6 | Astro | Astro's own wizard will ask you a few questions |
| 7 | Angular | |
| 8 | Remix | |
| 9 | SolidJS | |
| 10 | Qwik | |

### Backend (11–13)

| # | Project | Notes |
|---|---------|-------|
| 11 | Laravel (PHP) | Requires Composer |
| 12 | NestJS (Node) | Structured Node.js backend |
| 13 | Express (Node) | Fresh folder + `npm init` + express — minimal start |

### Mobile (14–15)

| # | Project | Notes |
|---|---------|-------|
| 14 | React Native (Expo) | Easier to get started |
| 15 | React Native CLI | More control, longer setup |

### JS Add-ons (16)

**Important:** you need to be **inside an existing JS project folder** (one that already has a `package.json`).

- Axios
- Tailwind CSS (+ postcss and autoprefixer)
- React Router

### Exit (17)

Normal exit — same message as Ctrl+C.

---

## Tips

1. **Project name** — no spaces. Stick to letters, numbers, and hyphens.
2. **Next.js / Nuxt / SvelteKit / Astro** — these tools may open their own interactive wizards. That's expected; it's not the script acting up.
3. **JS Add-ons** — don't run this from the `initx` folder itself. `cd` into your project first.
4. **Laravel** — the script won't open VS Code automatically. Open the folder yourself if you need to.

---

## Files

```
initx/
├── initx.sh    ← the script — that's all you need
├── LICENSE     ← MIT — use, modify, and share freely
└── README.md   ← you're reading it
```

No dependencies, no `npm install` for the script itself. Just Bash.

---

## License

MIT © [Hesham Yasser](LICENSE) — open source. Use it, change it, share it.

---

## Credits

**Ecto-initx** — by **Hesham Yasser**

Want to add a framework or tweak something? Edit `initx.sh` directly. It's open and kept simple on purpose.
