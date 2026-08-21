+++
date = 2026-02-10T09:00:00Z
title = "Advent of CLI coding agents"
path = "blog/2026/02/10/advent-of-cli-coding-agents/"
+++

## Background

I have been quite the sceptic about the adoption of AI for the past three or so years.

Initially I was grumpy about it being used to turn concise sentences and paragraphs into long blathering word soups with the occasional hallucination. Then this spilled out to the wider web, destroying my ability to reliably use a search engine, because every search index has been flooded with generative content. Which is why this blog post is still written by "hand" in my own voice.

Soon after everybody jumped onto the hype train and jammed AI into their products in order to still look relevant. Now you can't do anything without burning a small rainforest to get an AI summary that you didn't ask for.

I've also observed a more subtle socio-technical cost from people using AI without disclosing that they used AI. Plenty of time has been wasted trying to figure out whether something was written intentionally by a human or less intentionally by an LLM, which is a difficult subject to broach without causing offence. If I ask you a question then I want your opinion, not that of an LLM, otherwise I would have just asked an LLM myself.

## Tooling journey

I started out using ChatGPT for coding specific problems. Sometimes it would be useful, but more often than not it would hallucinate solutions like calling functions that don't exist or solutions that weren't relevant. Managing context by attaching or copy/pasting the right portions of code was very cumbersome and the feedback loop for applying and verifying changes was even worse.

I've used (and still do) GitHub Copilot in my editor which has been useful but in a very different way. I think of it as not much more than an intelligent auto-complete that lets me be more lenient with the exact syntax of a language and takes the tedium out of updating boilerplate code like test cases, function signatures, and match statements. Occasionally I'll guide it with some code comments but I don't tend to use it for actual problem solving.

The chat interface to GitHub Copilot has proved about as useful as ChatGPT, which is not very. It was easier to manage context than copy/pasting relevant files into another application but introduced a new problem of needing to carefully prune which open files were included so that it didn't exceed the context window or go off track. This is particularly true if you use a persistent editor session for multiple tasks.

I avoided a generation of remote agents like Devin because they didn't seem to provide enough value for the amount of babysitting that was required.

## CLI era

CLI based agents were the first that really clicked with me - namely Claude Code, Gemini CLI, and OpenAI Codex. I finally had that "wow" moment. Besides the advancement of coding-specific models, the key difference for me was shortening the feedback loop by being able to automatically:

- **locate context** such as the definition for a type or function, regardless of whether the files are in my project or a third-party library
- **update files** in place with the changes required
- **run commands** to verify its own work, so it can complete the loop by automatically discovering and fixing its own mistakes

I've also found it more natural being able to choose when to reset the context window, such as when I start a new task or find it going off track, without needing to change the way I work in an editor.

## Where it works well

I've found that it works particularly well for..

Integrating with poorly documented libraries and APIs, especially against machine-generated code. That stuff is maddening to work with and it turns out that machines are quite good at understanding other machines.

Prototyping changes in order to determine whether something is worth pursuing further. I often find it hard to visualise whether an approach is actually good or feasible until some of the work has already been done and the edge cases have fallen out. Being able to do that quicker and be less precious about throwing away the bad results allows you to make better decisions.

Making wide-reaching changes that require a lot of boilerplate code. Like when you introduce a new argument to a function in a strongly typed language and then nothing will compile until you've updated every part of the call stack. Per the previous example, you might decide that it wasn't the right approach anyway because the far-reaching changes were a bad smell, but it can be hard to tell that early in the process.

Breaking writer's block when approaching a new bug or feature. Sometimes there are just too many places to start or none of them fill you with excitement. Agents don't care though. Being able to just get going creates time for the more interesting parts of the work. It's also unlocked a lot of work where I struggled to justify the time investment based on our understanding of the problem and possible solutions at the time.

Catching things you might otherwise forget. There's a long list of things that engineers always need to consider based on task-specific context, best practices, and scar tissue from previous mistakes. It's easy for humans to forget some of these and computers are great at reminding us. I've always been a big fan of linters and have contributed to several for that reason.

## Skills and values

It's natural to associate a fair amount of your professional worth as a software engineer with your ability to solve problems and write code. Letting something else do this for you feels like giving up part of yourself which feels deeply uncomfortable. That feeling is exaggerated by an industry that still over-indexes on the ability to write code when assessing interview candidates. So I'm very wary about losing the muscle memory for writing code. Not to mention what do you do when the tooling goes down, which it has and it will again.

I'm reassured though that using AI effectively still requires most of the same skills that make for a good engineer. I haven't yet used a tool or model that will debug complex problems or write high quality code all by itself. You have to treat them like very enthusiastic but overconfident engineers that make mistakes and require lots of guiding. There are a lot of similarities with the things I really enjoy about technical leadership and pair programming, where you're contributing to progress rather than necessarily writing all the code yourself. I'm not so fond of diminishing human interactions though.

We may now be at the point where observing how an interview candidate uses a CLI agent to complete a set task is a more effective and less biased way of assessing their skills than the contrived coding challenges and pairing exercises (which aren't really pairing) of today.

Meanwhile I have no interest in becoming a "prompt engineer" who spends lots of time carefully crafting prompts and agent personas to behave like real people. It feels odd to program a computer with suggested guidelines written in prose when we have real programming languages. Tooling needs to meet people closer to where they are today, which is hopefully more of the direction that we're going.

## Vibing

Based on the code I've seen produced, I'm still deeply sceptical whether "vibe" coding has any place outside of one-off projects. It's easy to be seduced by the first working pass of a new project or feature but the hard work always comes in the subsequent iterations and ongoing maintenance.

LLMs will happily litter a codebase with many variations of the same spaghetti just to get the job done. There's a school of thought that the actual code doesn't matter if it works (for some value) as expected and you only intend to maintain the code with LLMs thereafter.

Yet we know that the performance of LLMs gets dramatically worse as the size of the required context window increases, which makes it hard to view that approach as anything other than compounding technical debt which we'll need to pay back sooner or later. So my aim is still to produce work that's easy for other humans to review and maintain.

## Costs

We know that AI has a very real cost in terms of research, hardware, electricity, and therefore the environment. So it feels reasonable that using it should have a real cost to the end user. Current subscription plan costs are nothing when factored into (not instead of) the salary of most engineers or software licenses and I believe they provide good value for what you can do with them.

I'm torn though, as a long time advocate of free and open source software, because those opportunities aren't available to everyone. Or that they will soon come with hidden costs like advertisement partnerships or compromising data privacy. I don't think that I would justify paying for a subscription out of my own pocket just for hobby projects. I also don't believe that self-hosting models is feasible if you want to keep up with the rate that the technology is advancing.

## My current workflow

At the time of writing, I'm predominantly using Claude Code with a Max 5x plan and Opus 4.5. With the rate that tooling and models are changing I don't expect much of the information in this section to stay relevant for very long.

Agents work best when the acceptance criteria is clear, so it's worth investing time in the planning process and defining automated tests. I tend to spend a while working on a detailed plan that explicitly shows the structure and excerpts of the code, so that I can be confident that it won't go off the rails too much in a direction that I don't intend or like. If enough of the scaffolding already exists then I may start by writing the tests first myself. Once I'm happy with the plan then I'll let it run in "accept edits" mode for a while. Then I'll use my editor to review and commit the changes myself. If I want to make small tweaks from there then I'll prompt and approve them as I go rather than letting it run.

I've had mixed results with getting the agent to break down work into "commit sized" and "human understandable" stages itself. The success rate seems to be strongly related to how confident I am that the whole plan will be successful in its current form. More often than not it seems slightly more efficient to get the whole thing working and then break it down afterwards. I've had some recent success with using an agent to then retrospectively break large changes into smaller commits.

This feels a bit backwards compared to how I would normally approach breaking down work myself. There is something very odd about needing to give context to the agent whilst also being careful about not giving it too much. I've found that it's much easier to compartmentalise those different threads in my head than it is to convey them to a context-constrained agent and there are plenty of times where it's still easier to work without an agent at all.

## Conclusion

If you're a fellow sceptic then now feels like the right time to put some of that aside. Not all of it - the concerns about quality, costs, and professional skills are worth holding onto. But there is value to be had and if you leave it too long then you might end up feeling like you've been left behind.
